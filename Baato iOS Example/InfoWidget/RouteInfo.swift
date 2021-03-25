//
//  RouteInfo.swift
//  BaatoApp
//
//  Created by Bhawak Pokhrel on 10/14/20.
//  Copyright © 2020 Bhawak Pokhrel. All rights reserved.
//

import UIKit

class RouteInfo: UIView {
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var navstart: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        backgroundColor = UIColor.init(named: "custom")
//    }
    func initSubviews() {
        let nib = UINib(nibName: "RouteInfo", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
//        Bundle.main.loadNibNamed("RouteInfo", owner: self, options: nil)
        contentView.frame = bounds
        navstart.isUserInteractionEnabled = true
        navstart.layer.cornerRadius = 6;
        navstart.layer.masksToBounds = true
        addSubview(contentView)
//        self.contentView.layoutIfNeeded();
    }

}
