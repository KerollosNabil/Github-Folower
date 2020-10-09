//
//  UIView+fraction.swift
//  Github Folower
//
//  Created by MAC on 10/8/20.
//

import UIKit

extension UIView{
    func fractionOf414WidthFrom(points:CGFloat) -> CGFloat {
        return CGFloat(points) / 414.0
    }
    func fractionOf896HeightFrom(points:CGFloat) -> CGFloat {
        return CGFloat(points) / 896.0
    }
    func WidthOn414Screen(of points:CGFloat) -> CGFloat {
        points * (bounds.width / 414.0)
    }
}
