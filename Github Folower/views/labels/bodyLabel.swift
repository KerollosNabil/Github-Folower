//
//  bodyLabel.swift
//  Github Folower
//
//  Created by MAC on 10/18/20.
//

import UIKit

class BodyLabel: UILabel {

    var fitText = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(textAlignment:NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        guard fitText else {return}
        
        if numberOfLines > 0 {
            fitText(maxLines: UInt(numberOfLines))
        }else{
            fitTextToBounds()
        }
    }
    private func configure(){
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
