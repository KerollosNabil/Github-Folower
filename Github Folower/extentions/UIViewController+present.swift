//
//  UIviewControler+present.swift
//  Github Folower
//
//  Created by MAC on 11/2/20.
//

import UIKit

extension UIViewController{
    func presentGFAlertOnMainThread(title:String, message:String, buttontitle:String){
        DispatchQueue.main.async {
            let alertVC = AlertVC<TitleLabel, BodyLabel>(title: title, message: message)
            let button = RoundedButton(backgroungColor: .systemPink, title: buttontitle)
            alertVC.addButton(button: button, action: nil, target: nil)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            alertVC.backgroundColor = .black
            alertVC.adjustBodyFontToFit = false
            self.present(alertVC, animated: true)
        }
        
    }
    func add(chiledVC:UIViewController, to containerView:UIView) {
        addChild(chiledVC)
        containerView.addSubview(chiledVC.view)
        chiledVC.view.frame = containerView.bounds
    }
}
