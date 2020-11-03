//
//  AutolayoutHelper.swift
//  Github Folower
//
//  Created by MAC on 10/9/20.
//

import UIKit


class AutolayoutHelper {
    
    
    var designCalculator:DesignSizeCalculator
    var deviceSizeClassManager = DeviceSizeClassManager()
    var designView:UIView
    
    init(designCalculator:DesignSizeCalculator, designView:UIView) {
        self.designCalculator = designCalculator
        self.designView = designView
    }
    
    init(designViewSizePortraitMode:CGSize, designView:UIView) {
        
        self.designCalculator = DesignSizeCalculator(designViewSizePortraitMode: designViewSizePortraitMode, curentView: designView)
        self.designView = designView
    }
    
    func startLayout()  {
        deviceSizeClassManager.startLayout()
    }
    
    func addViewSizeConstrainsGuidedByWidth(to view:UIView, with designSize:CGSize, designOrientationIsPortrait:Bool, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>) {
        let widthRatio = designSize.width / designCalculator.getDesignSize(baseOn: designOrientationIsPortrait).width
        let aspectRatio = designSize.height / designSize.width
        let widthConstraint = view.widthAnchor.constraint(equalTo: designView.widthAnchor, multiplier: widthRatio)
        let heightConstraint = view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: aspectRatio)
        
        deviceSizeClassManager.addConstraints(constraints: [widthConstraint,heightConstraint], for: sizeClasses)
        
    }
    func addViewSizeConstrainsGuidedByHeight(to view:UIView, with designSize:CGSize, designOrientationIsPortrait:Bool, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>) {
        let heightRatio = designSize.height / designCalculator.getDesignSize(baseOn: designOrientationIsPortrait).height
        let aspectRatio = designSize.width / designSize.height
        let heightConstraint = view.heightAnchor.constraint(equalTo: designView.heightAnchor, multiplier: heightRatio)
        let widthConstraint = view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: aspectRatio)
        deviceSizeClassManager.addConstraints(constraints: [widthConstraint,heightConstraint], for: sizeClasses)
        
    }
    
    func attatchScalably<T:NSLayoutXAxisAnchor> (anchor:NSLayoutAnchor<T>, to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let anchorConstraint = anchor.constraint(equalTo: to, constant: constant * designCalculator.widthFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [anchorConstraint], for: sizeClasses)
    }
    func attatchScalably<T:NSLayoutYAxisAnchor> (anchor:NSLayoutAnchor<T>, to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        
        let anchorConstraint = anchor.constraint(equalTo: to, constant: constant * designCalculator.heightFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [anchorConstraint], for: sizeClasses)
    }
}
