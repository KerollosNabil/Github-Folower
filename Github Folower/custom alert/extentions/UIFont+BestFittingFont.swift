//
//  UIFont+BestFittingFont.swift
//  try button stack
//
//  Created by MAC on 10/26/20.
//

import UIKit

public enum TextSizingOption: Equatable {
    case preferredLineCount(UInt)
    case fillContainer
    
    public static func == (lhs: TextSizingOption, rhs: TextSizingOption) -> Bool {
        switch (lhs, rhs) {
        case (let .preferredLineCount(lines1), let .preferredLineCount(lines2)):
            return lines1 == lines2
        case (.fillContainer, .fillContainer):
            return true
        default:
            return false
        }
    }
}

extension UIFont {
    
    /**
     Will return the best font conforming to the descriptor which will fit in the provided bounds.
     */
    static func fontFittingText(_ text: String, in bounds: CGSize, fontDescriptor: UIFontDescriptor, option: TextSizingOption) -> UIFont? {
            let properBounds = CGRect(origin: .zero, size: bounds)
            let largestFontSize = Int(bounds.height)
            let constrainingBounds = CGSize(width: properBounds.width, height: CGFloat.infinity)
            // guard largestFontSize > 0 else {return nil}
            
            let bestFittingFontSize: Int? = (1...largestFontSize).reversed().first(where: { fontSize in
                let font = UIFont(descriptor: fontDescriptor, size: CGFloat(fontSize))
                let currentFrame = text.boundingRect(with: constrainingBounds, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font], context: nil)
                
                if properBounds.contains(currentFrame) {
                    let currentFrameLineCount = Int(floor(currentFrame.height / font.lineHeight))
                    if case .preferredLineCount(let lineCount) = option, currentFrameLineCount > max(lineCount, 1) {
                        return false
                    }
                    return true
                }
                
                return false
            })
            
            guard let fontSize = bestFittingFontSize else { return nil }
            return UIFont(descriptor: fontDescriptor, size: CGFloat(fontSize))
        }
}
