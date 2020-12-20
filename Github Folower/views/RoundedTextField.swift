//
//  RoundedTextField.swift
//  Github Folower
//
//  Created by MAC on 10/8/20.
//

import UIKit

class RoundedTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configur()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configur()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = min(bounds.height, bounds.width) / 5.0
    }
    private func configur() {

        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        translatesAutoresizingMaskIntoConstraints = true
                
    }

}
