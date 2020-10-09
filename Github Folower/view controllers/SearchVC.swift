//
//  SearchVC.swift
//  Github Folower
//
//  Created by MAC on 10/7/20.
//

import UIKit

class SearchVC: UIViewController {
    let logoImageView = UIImageView()
    let usernameTF = RoundedTextField(placeholder: "Enter a Username")
    let getFollowersButton = RoundedButton(backgroungColor: .systemGreen, title: "Get Followers")
    
    let autolayoutHelper = AutolayoutHelper(designingDevice: .xsMaxAnd11ProMaxAnd11AndXr)
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.bounds)
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureUsernameTF()
        configureGetFollowersButton()
        autolayoutHelper.sharedConstraints.activate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height * view.fractionOf896HeightFrom(points: 80)),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(viewSize: CGSize(width: 200, height: 200), view: logoImageView, containerView: view, for: .forsharedConstraints)
    }
    
    private func configureUsernameTF(){
        view.addSubview(usernameTF)
        
        
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            usernameTF.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: view.bounds.height * view.fractionOf896HeightFrom(points: 48)),
            usernameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(viewSize: CGSize(width: 314, height: 50), view: usernameTF, containerView: view, for: .forsharedConstraints)
    }
    
    private func configureGetFollowersButton(){
        view.addSubview(getFollowersButton)
        
        
        getFollowersButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: view.bounds.height * view.fractionOf896HeightFrom(points: -50)),
            getFollowersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(viewSize: CGSize(width: 314, height: 50), view: getFollowersButton, containerView: view, for: .forsharedConstraints)
    }

}
