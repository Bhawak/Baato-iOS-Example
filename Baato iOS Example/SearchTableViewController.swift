//
//  SearchTableViewController.swift
//  BaatoApp
//
//  Created by Bhawak Pokhrel on 6/21/20.
//  Copyright © 2020 Bhawak Pokhrel. All rights reserved.
//

import UIKit
import Mapbox
import MaterialComponents.MaterialSnackbar
import BaatoSwift

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    var searchResult: Set<BaatoSwift.SearchResult>?

    var orderedSearchResults: [BaatoSwift.SearchResult]? {
        guard let searchResults = searchResult else {
            return nil
        }
        return Array(searchResults).sorted(by: { resultA, resultB in return resultA.score > resultB.score})
    }
    var myLocation: CLLocationCoordinate2D?
    var searchText: String = ""
    let spinner = UIActivityIndicatorView(style: .gray)
    let manager = MDCSnackbarManager()
    let errorSnack = MDCSnackbarMessage()
//    weak var delegate: SearchTableViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "searchDetail")
//        if let cancelButton : UIButton = searchBar.value(forKey: "cancelButton") as? UIButton{
//            cancelButton.isEnabled = true
//        }

        // loading spinner
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        self.tableView.tableFooterView = spinner
        self.tableView.tableFooterView?.isHidden = true
        self.tableView.tableHeaderView = searchController.searchBar
        // 1
        // 2
        if #available(iOS 9.1, *) {
            self.searchController.obscuresBackgroundDuringPresentation = false
        } else {
            // Fallback on earlier versions
        }
        // 3
        self.searchController.searchBar.placeholder = "Search Places"
        self.searchController.searchBar.text = searchText
        self.searchController.searchBar.delegate = self
        self.searchController.delegate = self
        self.tableView.delegate = self

        definesPresentationContext = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            self.searchController.dismiss(animated: false)
            self.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SearchCancel"), object: nil)
        }
//        dismiss(animated: true, completion: nil)
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.updateSearch()
//        }
    }
    func presentSearchController(_ searchController: UISearchController) {
        self.searchController.searchBar.becomeFirstResponder()
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.searchController.isActive = true
            self.updateSearch()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
//        self.searchBar.becomeFirstResponder();
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 44 : 104
    }
    func mapError(error: Error) {
        errorSnack.text = error.localizedDescription
        errorSnack.duration = 10
    }
    func updateSearch() {
        if searchController.searchBar.text?.count ?? 0 > 0 {
            self.tableView.tableFooterView?.isHidden = false
            spinner.startAnimating()
            let apis = BaatoSwift.API.init(token: Constant.key)
            apis.searchQuery = searchController.searchBar.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            apis.searchLimit = 20
            if let myLocation = myLocation {
                apis.searchLat = myLocation.latitude
                apis.searchLon = myLocation.longitude
            }

            self.manager.dismissAndCallCompletionBlocks(withCategory: .none)

            apis.getSearch { (result) in
                self.tableView.tableFooterView?.isHidden = true
                switch result{
                case .success(let data):
                    guard let data = data else {
                        return
                    }
                    self.searchResult = Set(data)
                    self.tableView.reloadData()

                case .failure(let error):
                     self.mapError(error: error)
                     let action = MDCSnackbarMessageAction()
                     let actionHandler = {() in
                        self.updateSearch()
                     }
                     action.handler = actionHandler
                     action.title = "Retry"
                     self.errorSnack.action = action
                     self.manager.show(self.errorSnack)
//                     print("error:", error.localizedDescription)

                }
            }
            }
//        else {
//                self.tableView.tableFooterView?.isHidden = true
//                errorSnack.text = "You are offline. Please check your internet connection!"
//                errorSnack.duration = 10
//                let action = MDCSnackbarMessageAction()
//                let actionHandler = {() in
//                   self.updateSearch()
//                }
//                action.handler = actionHandler
//                action.title = "Retry"
//                self.errorSnack.action = action
//                self.manager.show(self.errorSnack)
//       }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResult?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchDetail", for: indexPath) as? SubtitleTableViewCell else {
            fatalError()
        }

        cell.textLabel?.text = orderedSearchResults![indexPath.row].name
        cell.detailTextLabel?.text = orderedSearchResults![indexPath.row].address

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "search":
            print("Search initialted")
        default:
            print("segue not identified")
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SearchResult"), object: orderedSearchResults![indexPath.row])
        }
        DispatchQueue.main.async {
            self.searchController.dismiss(animated: false)
            self.dismiss(animated: true, completion: nil)
        }
    }

}
