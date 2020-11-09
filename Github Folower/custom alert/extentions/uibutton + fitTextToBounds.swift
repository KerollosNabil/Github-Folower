//
//  Label+ fitTextToBounds.swift
//  try button stack
//
//  Created by MAC on 10/26/20.
//

import UIKit

extension UIButton {
    
    /// Will auto resize the contained text to a font size which fits the frames bounds.
    /// Uses the pre-set font to dynamically determine the proper sizing
    func fitText(maxLines: UInt) {
        guard let titleLabel = titleLabel, let text = titleLabel.text, let font = titleLabel.font else { return }
        titleLabel.numberOfLines = 0
        print(bounds)
        self.titleLabel?.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .preferredLineCount(maxLines))
        
        
    }
        
        /**
         Autosizes `font` to the largest value where the text can still be contained in the view's bounds.
         */
        func fitTextToBounds() {
            guard let titleLabel = titleLabel, let text = titleLabel.text, let font = titleLabel.font else { return }
            titleLabel.numberOfLines = 0
            self.titleLabel?.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .fillContainer)
        }
}
