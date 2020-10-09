//
//  AutolayoutHelper.swift
//  Github Folower
//
//  Created by MAC on 10/9/20.
//

import UIKit


class AutolayoutHelper {
    
    
    private var designingDevice:Devices
    private var designedDeviceSize:CGSize
    
    var sharedConstraints = [NSLayoutConstraint]()
    var regularRegularConstraints = [NSLayoutConstraint]()
    var regularCompactConstraints = [NSLayoutConstraint]()
    var compactRegularConstraints = [NSLayoutConstraint]()
    var compactCompactConstraints = [NSLayoutConstraint]()
    
    enum TraitOptions {
        case forsharedConstraints
        case forRegularRegular
        case forRegularCompact
        case forCompactRegular
        case forCompactCompact
    }
    enum Devices{
        case xsMaxAnd11ProMaxAnd11AndXr
        case xAndXsAnd11Pro
        case plusDevices
        case nonPlusDevices
        case ipodAndSE
        
        func getDeviceScreenSize() -> CGSize {
            switch self {
            case .xsMaxAnd11ProMaxAnd11AndXr: return CGSize(width: 414, height: 896)
            case .xAndXsAnd11Pro:return CGSize(width: 375, height: 812)
            case .plusDevices:return CGSize(width: 414, height: 736)
            case .nonPlusDevices:return CGSize(width: 375, height: 667)
            case .ipodAndSE:return CGSize(width: 320, height: 568)
            }
        }
    }
    
    init(designingDevice:Devices) {
        self.designingDevice = designingDevice
        self.designedDeviceSize = designingDevice.getDeviceScreenSize()
    }
    
    private func appendConstrsints(for traitOption:TraitOptions, constrsaints:[NSLayoutConstraint]) {
        switch traitOption {
            case .forsharedConstraints:sharedConstraints.append(contentsOf: constrsaints)
            case .forRegularRegular:regularRegularConstraints.append(contentsOf: constrsaints)
            case .forRegularCompact:regularCompactConstraints.append(contentsOf: constrsaints)
            case .forCompactRegular:compactRegularConstraints.append(contentsOf: constrsaints)
            case .forCompactCompact:compactCompactConstraints.append(contentsOf: constrsaints)
        }
    }
    
    func addViewSizeConstrainsGuidedByWidth(viewSize:CGSize, view:UIView, containerView:UIView, for traitOption:TraitOptions) {
        let widthRatio = viewSize.width / designedDeviceSize.width
        let aspectRatio = viewSize.height / viewSize.width
        let widthConstraint = view.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: widthRatio)
        let heightConstraint = view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: aspectRatio)
        
        appendConstrsints(for: traitOption, constrsaints: [widthConstraint, heightConstraint])
        
    }
    func addViewSizeConstrainsGuidedByHeight(viewSize:CGSize, view:UIView, containerView:UIView, for traitOption:TraitOptions) {
        let heightRatio = viewSize.height / designedDeviceSize.height
        let aspectRatio = viewSize.width / viewSize.height
        let heightConstraint = view.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: heightRatio)
        let widthConstraint = view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: aspectRatio)
        appendConstrsints(for: traitOption, constrsaints: [widthConstraint, heightConstraint])
    }
}
