//
//  ViewController.swift
//  Baato iOS Example
//
//  Created by Bhawak Pokhrel on 3/21/21.
//

import UIKit
import Mapbox
import BaatoSwift
import MaterialComponents.MaterialSnackbar
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

class ViewController: UIViewController, MGLMapViewDelegate, NavigationMapViewDelegate {
    @IBOutlet weak var mapView: UIView!
    var mView: MGLMapView!
    var markerLayer: MGLStyleLayer?
    var point = MGLPointAnnotation()
    var startPoint = MGLPointAnnotation()
    var endPoint = MGLPointAnnotation()
    let apis = BaatoSwift.API.init(baseURL: "https://api.baato.io/api/v1", token: Constant.key)
    var defStyle = "https://api.baato.io/api/v1/styles/breeze?key="
    var btnImage = UIImage()
    let manager = MDCSnackbarManager()
    let errorSnack = MDCSnackbarMessage()
//    var route: NavResponse
    // For Route and navigation
    var routeInfo: RouteInfo?
    var routeOptions: NavigationRouteOptions?
    let mytStyle = DayStyle()
     var navigationViewController: NavigationViewController?
    var navigationService: NavigationService!
    var route: Route!
    var router: LegacyRouteController!

    override func viewDidLoad(){
        super.viewDidLoad()
        let url = URL(string: defStyle + Constant.key)
        mytStyle.mapStyleURL = url!
        mView = MGLMapView(frame: view.bounds, styleURL: url)
        mView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mView.setCenter(CLLocationCoordinate2D(latitude: 27.7172, longitude: 85.3240), zoomLevel: 12, animated: false)
        mView.delegate = self
        mView.logoView.image = UIImage(named: "BaatoLogo")
        mView.logoView.tintColor = UIColor.init(red: 8/255, green: 127/255, blue: 82/255, alpha: 1.0)
        mView.logoViewMargins = CGPoint.init(x: 5, y: 10)
        mView.attributionButton.isHidden = true
        mView.logoViewPosition = .bottomLeft
        view.addSubview(mView)// Do any additional setup after loading the view.
        searchBTN()

        // Add a single tap gesture recognizer. This gesture requires the built-in MGLMapView tap gestures (such as those for zoom and annotation selection) to fail.
        let singleTap = UILongPressGestureRecognizer(target: self, action: #selector(handleMapTap(sender:)))
        for recognizer in mView.gestureRecognizers! where recognizer is UITapGestureRecognizer {
            singleTap.require(toFail: recognizer)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(onClose), name: Notification.Name(rawValue: "Back"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDirection), name: Notification.Name(rawValue: "RouteView"), object: nil)
        mView.addGestureRecognizer(singleTap)
        mView.userTrackingMode = .none

        // Enable the permanent heading indicator, which will appear when the tracking mode is not `.followWithHeading`.
        mView.showsUserHeadingIndicator = true
    }
    func searchBTN() {
        let mapButton:UIButton = UIButton(frame: CGRect(x:self.view.bounds.width - 50, y: self.view.bounds.height - 80, width: 40, height: 40)) //Swfit 5
        mapButton.backgroundColor = UIColor.init(red: 8/255, green: 127/255, blue: 82/255, alpha: 1.0)
        mapButton.tintColor = UIColor.white

        if #available(iOS 13.0, *) {
            mapButton.setImage(UIImage(named: "SearchLocation")?.withTintColor(UIColor.white), for: UIControl.State.normal)
        } else {
            mapButton.setImage(UIImage(named: "SearchLocation"), for: UIControl.State.normal)
        }


        mapButton.addTarget(self, action:#selector(self.searchClicked), for: .touchUpInside)
        mapButton.layer.cornerRadius = 20
        mapButton.tag = 125
        self.mView.addSubview(mapButton)
    }
    @objc func searchClicked(){
        let searchVC = SearchTableViewController()
        present(searchVC, animated: true)
    }
    @objc func onClose(){
        mView.viewWithTag(123)?.removeFromSuperview()
        guard let style = self.mView.style else { return }
        if(style.source(withIdentifier: "polyline") != nil) {
            // First remove layer than source for updating
            style.removeLayer(style.layer(withIdentifier: "polyline")!)
            style.removeSource(style.source(withIdentifier: "polyline")!)
        }
    }
    @objc func onDirection(){
        guard let userLocation = self.mView.userLocation else {
            locateSnack()
            return
        }
        self.startPoint.coordinate = userLocation.coordinate
        self.startPoint.title = "Your Location"
        self.mapView.layoutIfNeeded()
        getRoute()
    }
    func getRoute(){
            apis.startLat = startPoint.coordinate.latitude
            apis.startLon = startPoint.coordinate.longitude
            apis.destLat = point.coordinate.latitude
            apis.destLon = point.coordinate.longitude
            apis.navMode = BaatoSwift.NavigationMode.car
            apis.navInstructions = true
            self.manager.dismissAndCallCompletionBlocks(withCategory: .none)
            waitSnack()
        //showing route
            apis.getDirections { (result) in
                switch result {
                case .success(let navData):
                    guard  let navData = navData else {
                        return
                    }
                    self.manager.dismissAndCallCompletionBlocks(withCategory: .none)
                    let routeString = navData[0].encodedPolyline

                    guard let style = self.mView.style else { return }
                    if(style.source(withIdentifier: "polyline") != nil) {
                        // First remove layer than source for updating
                        style.removeLayer(style.layer(withIdentifier: "polyline")!)
                        style.removeSource(style.source(withIdentifier: "polyline")!)
                    }
                    let coordinates = BaatoSwift.DecoderPoly.decodePoints(routeString)
                    let shape = MGLPolyline(coordinates: coordinates, count: UInt(coordinates.count))
                    let source = MGLShapeSource(identifier: "polyline", shape: shape, options: nil)
                    style.addSource(source)
                            // Create new layer for the line.
                    let layer = MGLLineStyleLayer(identifier: "polyline", source: source)
                    layer.lineColor = NSExpression(forConstantValue: UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1))
                    layer.lineWidth = NSExpression(format: "mgl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)",
                                                   [14: 3, 18: 3])
                    style.addLayer(layer)

                case .failure (let error) :
                    print(error.localizedDescription)
                    self.mapError(error: error)
                }
            }

        //preparing for navigation
                apis.getMapboxDirections{(result) in
                    self.manager.dismissAndCallCompletionBlocks(withCategory: .none)
                                switch result {
                                case .success (let data):
                                    guard let data = data else {
                                        return
                                    }

                                    let origin = Waypoint(coordinate: self.startPoint.coordinate, name: "Origin")
                                    let destination = Waypoint(coordinate: self.point.coordinate, name: "Destination")
                                    self.routeOptions = NavigationRouteOptions(waypoints: [origin, destination])

// Set locale so that it takes kilometer/meter(metric), default or "en" takes imperial
                                    self.routeOptions!.locale = Locale.init(identifier: "ne")
                                    self.routeOptions!.distanceMeasurementSystem = .metric
                                    
                                    do {
                                        let decoder = JSONDecoder()
                                        guard let value = try? decoder.decode(ResType.self, from: data) else {
                                                print("Error parsing JSON")
                                                return
                                            }
//                                        let jsonObject = try JSONSerialization.jsonObject(with: data)
                                        let mValue = value.data?.routes?.first
                                        let mData = try mValue?.jsonString() 

                                        let mEro = Route.init(json: self.convertToDictionary(text: mData!)!, waypoints:[origin, destination], options: self.routeOptions!)
                                        self.route = mEro
                                        self.startNavigation(startPoint: self.startPoint, endPoint: self.point)

                                       } catch {
                                           print("JSONSerialization error:", error)
                                       }

                                case .failure (let error) :
                                    print(error.localizedDescription)
                                    self.mapError(error: error)
                                }
                }
//        }
    }
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    private func startNavigation(startPoint: MGLPointAnnotation, endPoint: MGLPointAnnotation){

        navigationService = MapboxNavigationService(route: self.route, directions: nil, locationSource: nil, eventsManagerType: nil, simulating: .onPoorGPS, routerType: LegacyRouteController.self)

        router = LegacyRouteController(along: self.route, dataSource: navigationService)


       let navigationOptions = NavigationOptions(styles: [mytStyle], navigationService: navigationService)

        self.navigationViewController = NavigationViewController(for: route, options: navigationOptions)
        self.navigationViewController?.modalPresentationStyle = .fullScreen
        self.navigationViewController?.delegate = self

        self.navigationViewController?.showsReportFeedback = false
        self.navigationViewController?.mapView?.logoView.image = UIImage(named: "BaatoLogo")

//        self.navigationViewController?.mapView?.recenterMap()

//        self.navigationViewController?.mapView?.minimumFramesPerSecond = MGLMapViewPreferredFramesPerSecond(rawValue: 1)
        self.navigationViewController?.mapView?.attributionButton.isHidden = true
        self.present(self.navigationViewController!, animated: false, completion: nil)
    }
    //On Map Long Press and Reverse Search Event
    @objc @IBAction func handleMapTap(sender: UITapGestureRecognizer) {
        if sender.state == .began {
        // Get the CGPoint where the user tapped.
        let spot = sender.location(in: mView)
        let tapCoordinate: CLLocationCoordinate2D = mView.convert(spot, toCoordinateFrom: mView)

        mView.removeGestureRecognizer(sender)

        //Set LatLng for
        apis.reverseLat = tapCoordinate.latitude
        apis.reverseLon = tapCoordinate.longitude
            self.endPoint.coordinate = tapCoordinate
        self.manager.dismissAndCallCompletionBlocks(withCategory: .none)
        waitSnack()

        //Requesting info from API for lat lng
        apis.getReverse{(result) in
                    self.manager.dismissAndCallCompletionBlocks(withCategory: .none)
                    self.mView.addGestureRecognizer(sender)
                    switch result{
                    case .success(let data):
                        guard let data = data else {
                           return
                        }
//                        self.routeInfo?.isHidden = false

                            self.mView.removeAnnotations([self.startPoint, self.endPoint])
                            self.addMarker(where: data)

                    case .failure(let error):
                        self.mapError(error: error)
                        self.handleTapEvent(sender: sender)
                    }
                }
            }
    }

    //Adding Marker Annotation
    func addMarker(where data: BaatoSwift.Place) {
        // Create Marker Point
//        point.coordinate = CLLocationCoordinate2D(latitude: data.centroid.lat, longitude: data.centroid.lon)

        point.coordinate = endPoint.coordinate
        if data.placeID != nil {
            point.title = data.name
            point.subtitle = data.address
            bottomView(where: data)
        }
        addAnnotation(where: point)
    }
    func addAnnotation(where annotation: MGLPointAnnotation){
        DispatchQueue.main.async {
            self.mView.addAnnotation(annotation)
        }
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, altitude: 4500, pitch: 0, heading: 0)

        // Animate the camera movement over 5 seconds.
        mView.setCamera(camera, withDuration: 0.5, animationTimingFunction: CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut))
    }


    func waitSnack() {
          let message = MDCSnackbarMessage(text: "Please wait ...")
          let action = MDCSnackbarMessageAction()
          action.title = .none
          message.action = action
          message.duration = 10.0
          manager.show(message)
     }
    func locateSnack() {
          let message = MDCSnackbarMessage(text: "Couldn't locate please check the location service.")
          let action = MDCSnackbarMessageAction()
          action.title = .none
          message.action = action
          message.duration = 10.0
          manager.show(message)
     }
    func handleTapEvent(sender: UITapGestureRecognizer) {
        let action = MDCSnackbarMessageAction()
        let actionHandler = {() in
           self.handleMapTap(sender: sender)
        }
        action.handler = actionHandler
        action.title = "Retry"
        self.errorSnack.action = action
        self.manager.show(self.errorSnack)
    }
    func mapError(error: Error) {
          errorSnack.text = error.localizedDescription
          errorSnack.duration = 10
      }
    private func bottomView(where data: BaatoSwift.Place){
        let placeDetail = PlaceDetail(frame: CGRect(x: 0, y: self.view.bounds.height - 500, width: UIScreen.main.bounds.width - 20, height: 200))
//        let placeDetail = (Bundle.main.loadNibNamed("PlaceDetail", owner: self, options: nil))?[0] as! PlaceDetail;

//        placeDetail.translatesAutoresizingMaskIntoConstraints = false
        placeDetail.titleLabel.text = data.name
        placeDetail.subtitleLabel.text = data.address
        placeDetail.place = data
        placeDetail.layer.frame = CGRect(x: 10, y: mapView.frame.maxY - 200, width: UIScreen.main.bounds.width - 20, height: 200)
//        placeDetail.removeFromSuperview()
        placeDetail.tag = 123
        mView.viewWithTag(123)?.removeFromSuperview()
        mView.addSubview(placeDetail)
    }
//    private func bottomRouteInfo(){
//        let data = route
//        routeInfo = RouteInfo(frame: CGRect(x: 0, y: mapView.frame.maxY - 150, width: UIScreen.main.bounds.width, height: 150))
//        routeInfo?.distance.text = String(format: "%.2f km", data.distanceInMeters/1000)
//        routeInfo?.navstart.addTarget(self, action: #selector(startNavigation), for: .touchUpInside)
//        routeInfo?.tag = 124
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.hour, .minute, .second]
//        if #available(iOS 10.0, *) {
//            formatter.unitsStyle = .brief
//        }
//
//        let formattedString = formatter.string(from: TimeInterval(data.timeInMs))!
//        routeInfo?.time.text = formattedString
//        routeInfo?.removeFromSuperview()
//        mapView.addSubview(routeInfo!)
//    }
}
// Navigation off-Route Computation
extension ViewController: NavigationViewControllerDelegate {

    func navigationViewController(_ navigationViewController: NavigationViewController, didRerouteAlong route: Route) {
        print("reroute captured")
    }

    // Never reroute internally. Instead,
    // 1. Fetch a route from your server
    // 2. Map Match the coordinates from your server
    // 3. Set the route on your server
    func navigationViewController(_ navigationViewController: NavigationViewController, shouldRerouteFrom location: CLLocation) -> Bool {

        // Here, we are simulating a custom server.
        let routeOptions = NavigationRouteOptions(waypoints: [Waypoint(location: location), self.routeOptions!.waypoints.last!])
        let startPoint = MGLPointAnnotation()
        guard let userLocation = self.mView.userLocation else {
            return false
        }
        startPoint.coordinate = userLocation.coordinate
        startPoint.title = "Origin"

        apis.startLat = startPoint.coordinate.latitude
        apis.startLon = startPoint.coordinate.longitude
        apis.destLat = point.coordinate.latitude
        apis.destLon = point.coordinate.longitude

        apis.getMapboxDirections{(result) in
            self.manager.dismissAndCallCompletionBlocks(withCategory: .none)
                        switch result {
                        case .success (let data):
                            guard let data = data else {
                                return
                            }

                            let origin = Waypoint(coordinate: self.startPoint.coordinate, name: "Origin")
                            let destination = Waypoint(coordinate: self.point.coordinate, name: "Destination")
                             let routeOptions = NavigationRouteOptions(waypoints: [origin, destination])
                            routeOptions.distanceMeasurementSystem = .metric

                            do {
                                let decoder = JSONDecoder()
                                guard let value = try? decoder.decode(ResType.self, from: data) else {
                                        print("Error parsing JSON")
                                        return
                                    }
                                let mValue = value.data?.routes?.first
                                let mData = try mValue?.jsonString()
                               let mRoute = Route.init(json: self.convertToDictionary(text: mData!)!, waypoints:[origin, destination], options: routeOptions)

                                let router = self.navigationService.router! as! LegacyRouteController
                                self.router = router

                                let routeProgress = RouteProgress(route: mRoute)
                                self.router.routeProgress = routeProgress

                               } catch {
                                   print("JSONSerialization error:", error)
                               }
                        case .failure (let error) :
                            print(error.localizedDescription)
                        }
        }
        return false
    }
//    func mapViewRegionIsChanging(_ mapView: MGLMapView) {
//
//    }
    func navigationViewController(_ navigationViewController: NavigationViewController, didUpdate progress: RouteProgress, with location: CLLocation, rawLocation: CLLocation) {
        self.navigationViewController?.mapView?.updateCourseTracking(location: location)
    }
    func navigationViewControllerDidDismiss(_ navigationViewController: NavigationViewController, byCanceling canceled: Bool) {
        navigationService.stop()
        routeInfo?.isHidden = false
        dismiss(animated: true, completion: nil)
        }
}
