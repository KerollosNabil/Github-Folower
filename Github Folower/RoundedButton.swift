//
//  RoundedButton.swift
//  Github Folower
//
//  Created by MAC on 10/8/20.
//

import UIKit

class RoundedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroungColor:UIColor, title:String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroungColor
        self.setTitle(title, for: .normal)
        configur()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = min(bounds.height, bounds.width) / 2.0

    }
    
    private func configur(){
        
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
