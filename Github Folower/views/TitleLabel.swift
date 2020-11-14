//
//  TitleLabel.swift
//  Github Folower
//
//  Created by MAC on 10/18/20.
//

import UIKit

class TitleLabel: UILabel {

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
        self.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        configure()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        print(bounds)
        fitText(maxLines: 1)

    }
    private func configure(){
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
