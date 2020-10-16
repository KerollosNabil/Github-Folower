//
//  ArrayOfconstraints+activation.swift
//  Github Folower
//
//  Created by MAC on 10/9/20.
//

import UIKit

extension Array where Element : NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate(self)
        if !isEmpty, !self[0].isActive {
            
        }
    }
    func deactivate() {
        NSLayoutConstraint.deactivate(self)
        if !isEmpty, self[0].isActive {
            
        }
    }
}
