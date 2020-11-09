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
        
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
            
            
            switch result{
            case .failure(let error): self.presentGFAlertOnMainThread(title: "bad stuff haperns", message: error.rawValue, buttontitle: "Ok")
            case .success(let follwers):print(follwers)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

    

}
