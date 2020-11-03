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
            let button2 = UIButton()
            button2.backgroundColor = .red
            button2.layer.cornerRadius = 12
            alertVC.addButton(button: button, action: nil, target: nil)
            alertVC.addButton(button: button2, action: nil, target: nil)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            alertVC.backgroundColor = .black
            alertVC.adjustBodyFontToFit = false
            self.present(alertVC, animated: true)
        }
        
    }
}
