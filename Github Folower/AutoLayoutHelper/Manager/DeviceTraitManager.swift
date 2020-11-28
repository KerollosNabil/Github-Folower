//
//  DeviceTraitManager.swift
//  Github Folower
//
//  Created by MAC on 10/13/20.
//

import UIKit


class DeviceSizeClassManager{
    
    var sizeClassConstraints = [DeviceSizeClassManager.DeviceSizeClass : [NSLayoutConstraint]]()
    
    
    func deactivateAllconstraints() {
        for layoutConstraints in sizeClassConstraints.values {
            layoutConstraints.deactivate()
        }
    }
    
    func startLayout()  {
        rotated()
    }
    
    private func createDeviceSizeClassRawValue(orientationValue:Int, widthSizeClassValue:Int, heightSizeClassValue:Int)->Int{
        return (orientationValue * 100) + (widthSizeClassValue * 10) + heightSizeClassValue
    }
    
    @objc func rotated() {
        let widthSizeClassValue = UIScreen.main.traitCollection.horizontalSizeClass.rawValue
        let heightSizeClassValue = UIScreen.main.traitCollection.verticalSizeClass.rawValue
        let orientationValue = (UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height) ? 1 : 0
        let DeviceSizeClassRawValue = createDeviceSizeClassRawValue(orientationValue: orientationValue, widthSizeClassValue: widthSizeClassValue, heightSizeClassValue: heightSizeClassValue)
        if let deviceSizeClass = DeviceSizeClass(rawValue: DeviceSizeClassRawValue){
            deactivateAllconstraints()
            if let constraintsForSizeClass = sizeClassConstraints[deviceSizeClass]{
                constraintsForSizeClass.activate()
            }
        }
        
    }
    
    func addConstraints(constraints:[NSLayoutConstraint], for sizeClases:Set<DeviceSizeClass>){
        
        for sizeClass in sizeClases {
            if sizeClassConstraints[sizeClass] == nil {
                sizeClassConstraints[sizeClass] = constraints
            }else{
                sizeClassConstraints[sizeClass]?.append(contentsOf: constraints)
            }
        }
    
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    enum DeviceSizeClass: Int {
        //where first deget is the oriantation(isPortrait), second is width size class, third is height size class
        case CompactCompact = 011
        case CompactRegular = 112
        case RegularCompact = 021
        case RegularRegularLandscape = 022
        case RegularRegularPortrait = 122
        func isPortrait() -> Bool {
            return (self.rawValue / 100) == 1
        }
        func getWidthSizeClass() -> UIUserInterfaceSizeClass {
            return UIUserInterfaceSizeClass(rawValue: (self.rawValue / 10) % 10)!
        }
        func getHeightSizeClass() -> UIUserInterfaceSizeClass {
            return UIUserInterfaceSizeClass(rawValue: self.rawValue % 10)!
        }
    }

}