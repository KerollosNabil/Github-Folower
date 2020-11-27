//
//  UIViewWithAutoLayoutHellper.swift
//  Github Folower
//
//  Created by MAC on 24/11/2020.
//

import UIKit

class UIViewWithAutoLayoutHellper: UIView {

    var layoutHelper = AutolayoutHelper(designViewSizePortraitMode: CGSize(width: 414, height: 896))
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        layoutHelper.startLayout()
    }

}
