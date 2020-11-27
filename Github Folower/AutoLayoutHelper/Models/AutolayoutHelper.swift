//
//  AutolayoutHelper.swift
//  Github Folower
//
//  Created by MAC on 10/9/20.
//

import UIKit


class AutolayoutHelper {
    
    
    var designCalculator:DesignSizeCalculator
    private var deviceSizeClassManager = DeviceSizeClassManager()
    
    
    init(designViewSizePortraitMode:CGSize) {
        
        self.designCalculator = DesignSizeCalculator(designViewSizePortraitMode: designViewSizePortraitMode)
    }
    
    func startLayout()  {
        deviceSizeClassManager.startLayout()
    }
    
    func addViewSizeConstrainsGuidedByWidth(to view:UIView, with designSize:CGSize, designOrientationIsPortrait:Bool, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>) {

        let widthRatio = designCalculator.widthRatio(baseOn: designOrientationIsPortrait)
        let aspectRatio = designSize.height / designSize.width
        let widthConstraint = view.widthAnchor.constraint(equalToConstant: designSize.width*widthRatio)
        let heightConstraint = view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: aspectRatio)
        
        deviceSizeClassManager.addConstraints(constraints: [widthConstraint,heightConstraint], for: sizeClasses)
        
    }
    func addViewSizeConstrainsGuidedByHeight(to view:UIView, with designSize:CGSize, designOrientationIsPortrait:Bool, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>) {
        let heightRatio = designCalculator.heightRatio(baseOn: designOrientationIsPortrait)
        let aspectRatio = designSize.width / designSize.height
        let heightConstraint = view.heightAnchor.constraint(equalToConstant: designSize.height*heightRatio)
        let widthConstraint = view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: aspectRatio)
        deviceSizeClassManager.addConstraints(constraints: [widthConstraint,heightConstraint], for: sizeClasses)
        
    }
    
    func attatchScaledToWidth<T:NSLayoutXAxisAnchor> (anchor:NSLayoutAnchor<T>, to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let anchorConstraint = anchor.constraint(equalTo: to, constant: constant * designCalculator.widthFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [anchorConstraint], for: sizeClasses)
    }
    func attatchScaledToHeight<T:NSLayoutXAxisAnchor> (anchor:NSLayoutAnchor<T>, to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let anchorConstraint = anchor.constraint(equalTo: to, constant: constant * designCalculator.heightFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [anchorConstraint], for: sizeClasses)
    }
    func attatchScaledToWidth<T:NSLayoutYAxisAnchor> (anchor:NSLayoutAnchor<T>, to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let anchorConstraint = anchor.constraint(equalTo: to, constant: constant * designCalculator.widthFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [anchorConstraint], for: sizeClasses)
    }
    func attatchScaledToHeight<T:NSLayoutYAxisAnchor> (anchor:NSLayoutAnchor<T>, to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let anchorConstraint = anchor.constraint(equalTo: to, constant: constant * designCalculator.heightFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [anchorConstraint], for: sizeClasses)
    }
    func addScaledToWidth<T:NSLayoutDimension>(dimension:NSLayoutAnchor<T>, equal to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let dimentionConstraint = dimension.constraint(equalTo: to, constant: constant * designCalculator.widthFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [dimentionConstraint], for: sizeClasses)
    }
    func addScaledToHeight<T:NSLayoutDimension>(dimension:NSLayoutAnchor<T>, equal to:NSLayoutAnchor<T>, constant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let dimentionConstraint = dimension.constraint(equalTo: to, constant: constant * designCalculator.heightFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [dimentionConstraint], for: sizeClasses)
    }
    func addScaledToWidth(dimension:NSLayoutDimension, equalconstant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let dimentionConstraint = dimension.constraint(equalToConstant: equalconstant * designCalculator.widthFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [dimentionConstraint], for: sizeClasses)
    }
    func addScaledToHeight(dimension:NSLayoutDimension, equalconstant:CGFloat, for sizeClasses:Set< DeviceSizeClassManager.DeviceSizeClass>, designOrientationIsPortrait:Bool){
        let dimentionConstraint = dimension.constraint(equalToConstant: equalconstant * designCalculator.heightFraction(isPortrait: designOrientationIsPortrait))
        deviceSizeClassManager.addConstraints(constraints: [dimentionConstraint], for: sizeClasses)
    }
}
