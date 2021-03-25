//
//  PlaceDetail.swift
//  BaatoApp
//
//  Created by Bhawak Pokhrel on 6/25/20.
//  Copyright © 2020 Bhawak Pokhrel. All rights reserved.
//

import UIKit
import BaatoSwift
class PlaceDetail: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBAction func onDirection(_ sender: UITapGestureRecognizer) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RouteView"), object: nil)
    }
    @IBOutlet weak var directionView: UIView!
    @IBOutlet weak var buttonImage: UIImageView!
    @IBAction func back(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Back"), object: nil)
    }


    var place: BaatoSwift.Place?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        let nib = UINib(nibName: "PlaceDetail", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        directionView.isUserInteractionEnabled = true
        directionView.layer.cornerRadius = 10;
        directionView.layer.masksToBounds = true
//        buttonImage.backgroundColor = .white
        addSubview(contentView)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
