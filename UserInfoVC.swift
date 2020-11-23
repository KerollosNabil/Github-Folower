//
//  UserInfoVC.swift
//  Github Folower
//
//  Created by MAC on 21/11/2020.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var user:Follower
    let headerInfoView = UIView()
    private var layoutHelper:AutolayoutHelper!

    init(user:Follower) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutHelper = AutolayoutHelper(designViewSizePortraitMode: CGSize(width: 414, height: 896))
        configureHeaderView()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        title = user.login
        
        NetworkManager.shared.getUser(for: user.login) { [weak self] result in
            guard let self = self else {return}
            switch(result){
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttontitle: "Ok")
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(chiledVC: UserInfoHeaderVC(user: user), to: self.headerInfoView)
                }
                
                
            
            }
        }
        layoutHelper.startLayout()
    }
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    
    private func configureHeaderView(){
        view.addSubview(headerInfoView)
        headerInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.attatchScalably(anchor: headerInfoView.topAnchor, to: view.safeAreaLayoutGuide.topAnchor, constant: 0, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScalably(anchor: headerInfoView.leadingAnchor, to: view.leadingAnchor, constant: 0, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: headerInfoView, with: CGSize(width: 414, height: 180), designOrientationIsPortrait: true, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape])
        
    }

}
