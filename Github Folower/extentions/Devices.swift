//
//  Devices.swift
//  Github Folower
//
//  Created by MAC on 10/12/20.
//

import UIKit

class DesignSizeCalculator{
    
    private var designViewSizePortrait:CGSize
    private var designViewSizeLandscape:CGSize
    private var curentViewSizePortrait:CGSize
    private var curentViewSizeLandscape:CGSize
    
    
    
    func widthFraction(isPortrait:Bool)->CGFloat {
        if isPortrait {
            return (curentViewSizePortrait.width / designViewSizePortrait.width)
        }else{
            return (curentViewSizeLandscape.width / designViewSizeLandscape.width)
        }
    }
    func heightFraction(isPortrait:Bool)->CGFloat {
        if isPortrait {
            return (curentViewSizePortrait.height / designViewSizePortrait.height)
        }else{
            return (curentViewSizeLandscape.height / designViewSizeLandscape.height)
        }
    }
    func getDesignSize(baseOn orientationIsPortrait:Bool) -> CGSize {
        return orientationIsPortrait ? designViewSizePortrait : designViewSizeLandscape
    }
    func widthRatio(baseOn orientationIsPortrait:Bool)->CGFloat{
        let designSize = orientationIsPortrait ? designViewSizePortrait : designViewSizeLandscape
        let currentSize = orientationIsPortrait ? curentViewSizePortrait : curentViewSizeLandscape
        return currentSize.width/designSize.width
    }
    func heightRatio(baseOn orientationIsPortrait:Bool)->CGFloat{
        let designSize = orientationIsPortrait ? designViewSizePortrait : designViewSizeLandscape
        let currentSize = orientationIsPortrait ? curentViewSizePortrait : curentViewSizeLandscape
        return currentSize.height/designSize.height
    }
    
    init(designViewSizePortraitMode:CGSize) {
        designViewSizePortrait = designViewSizePortraitMode
        let curentScreenSize = UIScreen.main.bounds
        designViewSizeLandscape = CGSize(width: designViewSizePortrait.height, height: designViewSizePortrait.width)
        curentViewSizePortrait = CGSize(width: min(curentScreenSize.width, curentScreenSize.height) , height: max(curentScreenSize.width, curentScreenSize.height))
        curentViewSizeLandscape = CGSize(width: curentViewSizePortrait.height, height: curentViewSizePortrait.width)
        
        
    }
    
    

    
    
}
