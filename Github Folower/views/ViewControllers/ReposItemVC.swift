//
//  ReposItemVC.swift
//  Github Folower
//
//  Created by MAC on 26/11/2020.
//

import UIKit

class RepoItemVC: ItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        infoItemViewOne.set(itemInfoType: .repos, count: user.publicRepos)
        infoItemViewTwo.set(itemInfoType: .gists, count: user.publicGists)
        actionButton.set(backgroungColor: .systemPurple, title: "Github Profile")
    }
}
