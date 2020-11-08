//
//  FollowerListCV.swift
//  Github Folower
//
//  Created by MAC on 10/16/20.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { (follwers, errorMessage) in
            guard let follwers = follwers else{
                self.presentGFAlertOnMainThread(title: "bad stuff haperns", message: errorMessage!, buttontitle: "Ok")
                return
            }
            print("Follwers number = \(follwers.count)")
            print(follwers)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

    

}
