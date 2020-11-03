//
//  AletVC.swift
//  Github Folower
//
//  Created by MAC on 10/19/20.
//

import UIKit

class AlertBodyVC<AlertTitleLabel, AlertMessageLabel>: UIViewController where AlertTitleLabel:UILabel, AlertMessageLabel:UILabel {
    
    
    private let titleLabel = AlertTitleLabel()
    private let messageLabel = AlertMessageLabel()
    private let buttonsStack = ButtonsStackVC()
    private let viewsStack = UIStackView()
    private var alertSize:CGSize?
    
    var adjustBodyFontToFit:Bool = true
    
    var alertBackGroundColor:UIColor = .systemBackground
    var alertBackgroundOpacity:CGFloat = 1
    var titleBackgroundColor:UIColor = .clear
    var bodyBackgroundColor:UIColor = .clear
    var buttonsViewBackgroundColor:UIColor = .clear
    var alertBorderColor:UIColor = UIColor.label
    
    var alertCornerRadusFractionOfWidath:CGFloat = 16/320
    var alertBorderWidthFractionOfWidath:CGFloat = 2/320
    var titleHeightFraction:CGFloat = 32/260
    var buttonsHeightFraction:CGFloat = 44/260
    
    
    var yAxisPaddingFraction:CGFloat = 10/220
    var xAxisPaddingFraction:CGFloat = 10/260
    
    
    init(title:String?, message:String?, alertSize:CGSize) {
        super.init(nibName: nil, bundle: nil)
        
        titleLabel.text = title ?? "Something Went Wrong"
        messageLabel.text = message ?? "koko"
        
        self.alertSize = alertSize
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView(){
        setupStackView()
        setupAlertProperties()
    }
    
    private func setupStackView(){
        view.addSubview(viewsStack)
        viewsStack.axis = .vertical
        viewsStack.alignment = .fill
        viewsStack.distribution = .fill
        viewsStack.spacing = UIStackView.spacingUseSystem
        
        alertStackViewAutoLayout()
        addSubViewToStackView()
    }
    
    private func alertStackViewAutoLayout() {
        viewsStack.translatesAutoresizingMaskIntoConstraints = false
        
        viewsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 - (xAxisPaddingFraction*2)).isActive = true
        viewsStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 - (yAxisPaddingFraction*2)).isActive = true
    }
    
    private func addSubViewToStackView() {
        addTitleLabel()
        addMessageLabel()
        addButtonsStackView()
    }
    
    private func addTitleLabel() {
        viewsStack.addArrangedSubview(titleLabel)
        titleLabel.textAlignment = .center
        
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: titleHeightFraction).isActive = true
    }
    private func addMessageLabel() {
        viewsStack.addArrangedSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        
        
    }
    private func addButtonsStackView() {
        addChild(buttonsStack)
        viewsStack.addArrangedSubview(buttonsStack.view)
        buttonsStack.didMove(toParent: self)
        buttonsStack.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: buttonsHeightFraction).isActive = true
        
    }
    
    private func setupAlertProperties(){
        self.view.backgroundColor = alertBackGroundColor
        self.view.alpha = alertBackgroundOpacity
        titleLabel.backgroundColor = titleBackgroundColor
        messageLabel.backgroundColor = bodyBackgroundColor
        buttonsStack.view.backgroundColor = buttonsViewBackgroundColor
        
        self.view.layer.cornerRadius = alertCornerRadusFractionOfWidath * (alertSize?.width ?? 0)
        self.view.layer.borderWidth = alertBorderWidthFractionOfWidath * (alertSize?.width ?? 0)
        self.view.layer.borderColor = alertBorderColor.cgColor
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if #available(iOS 13.0, *) {
            self.view.layer.borderColor = alertBorderColor.cgColor
        }
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateLabelsFont()
    }
    
    private func updateLabelsFont(){
        titleLabel.fitText(maxLines: 1)
        buttonsStack.updateButtonsFont()
        
        if adjustBodyFontToFit{ messageLabel.fitTextToBounds()}
        
    }


    
    func addButton<Button:UIButton>(button:Button, action:Selector?, target:Any?) {
        buttonsStack.addButton(button: button, action: action, target: target)
    }

    

}
