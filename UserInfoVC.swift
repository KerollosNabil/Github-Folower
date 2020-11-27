//
//  UserInfoVC.swift
//  Github Folower
//
//  Created by MAC on 21/11/2020.
//

import UIKit

class UserInfoVC: ViewControllerWithAutoLayoutHelper {
    
    var user:Follower
    
    var padding:CGFloat = 20
    
    private let headerInfoView = UIView()
    private let itemViewOne = UIView()
    private let itemViewTwo = UIView()

    init(user:Follower) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUI()
        getUserInfo()
    }
    
    private func configureViewController(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        title = user.login
    }
    
    private func getUserInfo(){
        NetworkManager.shared.getUser(for: user.login) { [weak self] result in
            guard let self = self else {return}
            switch(result){
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttontitle: "Ok")
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(chiledVC: UserInfoHeaderVC(user: user), to: self.headerInfoView)
                    self.add(chiledVC: RepoItemVC(user: user), to: self.itemViewOne)
                    self.add(chiledVC: FollowerItemVC(user: user), to: self.itemViewTwo)
                }
            }
        }
    }
    
    private func configureUI(){
        configureHeaderView()
        configureItemViewOne()
        configureItemViewTwo()
        layoutHelper.startLayout()
    }
    
    private func configureHeaderView(){
        view.addSubview(headerInfoView)
        headerInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.attatchScaledToWidth(anchor: headerInfoView.topAnchor, to: view.safeAreaLayoutGuide.topAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: headerInfoView.leadingAnchor, to: view.leadingAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: headerInfoView, with: CGSize(width: 374, height: 180), designOrientationIsPortrait: true, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape])
        
    }
    
    private func configureItemViewOne(){
        view.addSubview(itemViewOne)
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.topAnchor, to: headerInfoView.bottomAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.leadingAnchor, to: view.leadingAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.trailingAnchor, to: view.trailingAnchor, constant: -padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: itemViewOne.heightAnchor, equalconstant: 145, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
    }
    
    private func configureItemViewTwo(){
        view.addSubview(itemViewTwo)
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        layoutHelper.attatchScaledToWidth(anchor: itemViewTwo.topAnchor, to: itemViewOne.bottomAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewTwo.centerXAnchor, to: view.centerXAnchor, constant: 0, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: itemViewTwo, with: CGSize(width: 374, height: 145), designOrientationIsPortrait: true, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape])
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }

}
