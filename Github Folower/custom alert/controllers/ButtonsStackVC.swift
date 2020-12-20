//
//  ButtonsStack.swift
//  Github Folower
//
//  Created by MAC on 10/18/20.
//

import UIKit

class ButtonsStackVC: UIViewController {
    
    private var hStack = UIStackView()
    var fitTextToBound: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupTheStack()
    }
    
    private func setupTheStack() {
        view.addSubview(hStack)
        hStack.axis = .horizontal
        hStack.alignment = .fill
        hStack.distribution = .fillEqually
        
        layoutTheStack()
    }
    private func layoutTheStack() {
        
        hStack.spacing = UIStackView.spacingUseSystem
        hStack.layoutMargins = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        hStack.isLayoutMarginsRelativeArrangement = true
        hStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hStack.heightAnchor.constraint(equalTo: view.heightAnchor),
            hStack.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc func dismisAlert() {
        parent?.parent?.dismiss(animated: true)
    }
    
    func addButton<Button: UIButton>(button: Button, action: Selector?, target: Any?) {
        if let actionn = action {button.addTarget(target, action: actionn, for: .touchUpInside)}
        button.addTarget(self, action: #selector(dismisAlert), for: .touchUpInside)
        hStack.addArrangedSubview(button)
    }
    
}
