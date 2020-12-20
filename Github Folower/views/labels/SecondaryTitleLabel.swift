//
//  SecondaryTitleLabel.swift
//  Github Folower
//
//  Created by MAC on 22/11/2020.
//

import UIKit

class SecondaryTitleLabel: UILabel {

    var fitText = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        guard fitText else {return}
        
        if numberOfLines > 0 {
            fitText(maxLines: UInt(numberOfLines))
        } else {
            fitTextToBounds()
        }
    }
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        numberOfLines = 1
        translatesAutoresizingMaskIntoConstraints = false
    }

}
