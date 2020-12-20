//
//  FollowerItemVC.swift
//  Github Folower
//
//  Created by MAC on 26/11/2020.
//

import UIKit

class FollowerItemVC: ItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        infoItemViewOne.set(itemInfoType: .followers, count: user.followers)
        infoItemViewTwo.set(itemInfoType: .following, count: user.following)
        actionButton.set(backgroungColor: .systemGreen, title: "Get Followers")
    }
}
