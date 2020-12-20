//
//  ViewControllerWithAutoLayoutHelper.swift
//  Github Folower
//
//  Created by MAC on 23/11/2020.
//

import UIKit

class ViewControllerWithAutoLayoutHelper: UIViewController {

    var layoutHelper: AutolayoutHelper!
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutHelper = AutolayoutHelper(designViewSizePortraitMode: CGSize(width: 414, height: 896))
        // Do any additional setup after loading the view.
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        layoutHelper.startLayout()
    }

}
