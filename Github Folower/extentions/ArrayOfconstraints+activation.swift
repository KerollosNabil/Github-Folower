//
//  ArrayOfconstraints+activation.swift
//  Github Folower
//
//  Created by MAC on 10/9/20.
//

import UIKit

extension Array where Element : NSLayoutConstraint {
    func activate() {
        if !isEmpty, !self[0].isActive {
            NSLayoutConstraint.activate(self)
        }
        
        
    }
}
