//
//  Label+ fitTextToBounds.swift
//  try button stack
//
//  Created by MAC on 10/26/20.
//

import UIKit

extension UILabel {
    
    /// Will auto resize the contained text to a font size which fits the frames bounds.
    /// Uses the pre-set font to dynamically determine the proper sizing
    func fitText(maxLines: UInt) {
        guard let text = text, let font = font else { return }
        numberOfLines = 0
        self.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .preferredLineCount(maxLines))
    }
        
        /**
         Autosizes `font` to the largest value where the text can still be contained in the view's bounds.
         */
        func fitTextToBounds() {
            guard let text = text else { return }
            numberOfLines = 0
            self.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .fillContainer)
        }
}
