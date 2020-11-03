//
//  AlertVC.swift
//  Github Folower
//
//  Created by MAC on 11/2/20.
//

import UIKit

class AlertVC<AlertTitleLabel, AlertMessageLabel>: UIViewController where AlertTitleLabel:UILabel, AlertMessageLabel:UILabel {
    
    private var alertBodyVC : AlertBodyVC<AlertTitleLabel,AlertMessageLabel>!
   
    
    var alertSize:CGSize?
    var alertSizeFraction = CGSize(width: (320.0/414.0), height: (260/896))
    
    var adjustBodyFontToFit:Bool?
    
    var backgroundColor:UIColor = .systemBackground
    var alpha:CGFloat = 0.75
    var alertPosition:CGPoint?
    var centerOffsetFraction:CGPoint?
    
    var yAxisPaddingFractionOfHeight:CGFloat?
    var xAxisPaddingFractionOfWidth:CGFloat?
    var titleHeightFraction:CGFloat?
    var buttonsHeightFraction:CGFloat?
    
    var alertCornerRadusFractionOfWidath:CGFloat?
    var alertBorderWidthFractionOfWidath:CGFloat?
    
    var alertBackGroundColor:UIColor?
    var alertBackgroundOpacity:CGFloat?
    var titleBackgroundColor:UIColor?
    var bodyBackgroundColor:UIColor?
    var buttonsViewBackgroundColor:UIColor?
    var alertBorderColor:UIColor?
    
    init(title:String?, message:String?) {
        super.init(nibName: nil, bundle: nil)
        let width = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        let height = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        alertSize = CGSize(width: width * alertSizeFraction.width, height: height * alertSizeFraction.height)
        self.alertBodyVC = AlertBodyVC(title: title, message: message, alertSize:alertSize!)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlertView()
        configureAlertViewControler()
        
    }
    func setupAlertView(){
        view.backgroundColor = backgroundColor.withAlphaComponent(alpha)
    }
    func configureAlertViewControler(){
        self.addChild(alertBodyVC)
        configureAlertViewControlerProperties()
        view.addSubview(alertBodyVC.view)
        alertBodyVC.didMove(toParent: self)
        configureAlertViewControlerAutoLayout()
       
    }
    
    func configureAlertViewControlerAutoLayout(){
        alertBodyVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        alertBodyVC.view.widthAnchor.constraint(equalToConstant: alertSize!.width).isActive = true
        alertBodyVC.view.heightAnchor.constraint(equalToConstant: alertSize!.height).isActive = true
        if centerOffsetFraction == nil , let alertPosition = alertPosition{
            alertBodyVC.view.frame = CGRect(origin: alertPosition, size: alertBodyVC.view.bounds.size)
        }else{
            alertBodyVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: (centerOffsetFraction?.x ?? 0) * view.bounds.width).isActive = true
            alertBodyVC.view.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (centerOffsetFraction?.y ?? 0) * view.bounds.height).isActive = true
        }
        
    }
    
    
    
    
    func addButton<Button:UIButton>(button:Button, action:Selector?, target:Any?) {
        alertBodyVC.addButton(button: button, action: action, target: target)
    }
    
    func configureAlertViewControlerProperties(){
        if let xAxisPaddingFractionOfWidth = xAxisPaddingFractionOfWidth{
            alertBodyVC.xAxisPaddingFraction = xAxisPaddingFractionOfWidth
        }
        if let yAxisPaddingFractionOfHeight = yAxisPaddingFractionOfHeight{
            alertBodyVC.yAxisPaddingFraction = yAxisPaddingFractionOfHeight
        }
        if let titleHeightFraction = titleHeightFraction{
            alertBodyVC.titleHeightFraction = titleHeightFraction
        }
        if let buttonsHeightFraction = buttonsHeightFraction{
            alertBodyVC.titleHeightFraction = buttonsHeightFraction
        }
        if let alertCornerRadusFractionOfWidath = alertCornerRadusFractionOfWidath{
            alertBodyVC.alertCornerRadusFractionOfWidath = alertCornerRadusFractionOfWidath
        }
        if let alertBackGroundColor = alertBackGroundColor{
            alertBodyVC.alertBackGroundColor = alertBackGroundColor
        }
        if let alertBackgroundOpacity = alertBackgroundOpacity{
            alertBodyVC.alertBackgroundOpacity = alertBackgroundOpacity
        }
        if let titleBackgroundColor = titleBackgroundColor{
            alertBodyVC.titleBackgroundColor = titleBackgroundColor
        }
        if let bodyBackgroundColor = bodyBackgroundColor{
            alertBodyVC.bodyBackgroundColor = bodyBackgroundColor
        }
        if let buttonsViewBackgroundColor = buttonsViewBackgroundColor{
            alertBodyVC.buttonsViewBackgroundColor = buttonsViewBackgroundColor
        }
        if let alertBorderColor = alertBorderColor{
            alertBodyVC.alertBorderColor = alertBorderColor
        }
        if let adjustBodyFontToFit = adjustBodyFontToFit{
            alertBodyVC.adjustBodyFontToFit = adjustBodyFontToFit
        }
    }

}

