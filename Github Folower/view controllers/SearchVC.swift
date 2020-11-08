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
    
    private var isUsernameEntered:Bool{!usernameTF.text!.isEmpty}
    
    var autolayoutHelper : AutolayoutHelper! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.bounds)
        autolayoutHelper = AutolayoutHelper(designViewSizePortraitMode: CGSize(width: 414, height: 896), designView: self.view)
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureUsernameTF()
        configureGetFollowersButton()
        autolayoutHelper.startLayout()
        createDismissKeyboardTapGeature(to: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGeature(to view:UIView){
        let dismissKeyboardTapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(dismissKeyboardTapGesture)
    }
    
    @objc func pushFollowesListVC(){
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀.", buttontitle: "Ok")
            return
        }
        let followersListVC = FollowerListVC()
        followersListVC.userName = usernameTF.text
        followersListVC.title = usernameTF.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    private func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //add constraint for potrait mode

        autolayoutHelper.attatchScalably(anchor: logoImageView.topAnchor, to: view.topAnchor, constant: 80, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        autolayoutHelper.attatchScalably(anchor: logoImageView.centerXAnchor, to: view.centerXAnchor, constant: 0, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(to: logoImageView, with: CGSize(width: 200, height: 200), designOrientationIsPortrait: true, for: [.CompactRegular, .RegularRegularPortrait])
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(to: logoImageView, with: CGSize(width: 200, height: 200), designOrientationIsPortrait: false, for: [.RegularRegularLandscape])
        
        // for landscape
        
        autolayoutHelper.attatchScalably(anchor: logoImageView.leadingAnchor, to: view.safeAreaLayoutGuide.leadingAnchor, constant: 80, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        autolayoutHelper.attatchScalably(anchor: logoImageView.centerYAnchor, to: view.safeAreaLayoutGuide.centerYAnchor, constant: 0, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        autolayoutHelper.addViewSizeConstrainsGuidedByHeight(to: logoImageView, with: CGSize(width: 200, height: 200), designOrientationIsPortrait: false, for: [.CompactCompact,.RegularCompact])
    }
    
    private func configureUsernameTF(){
        view.addSubview(usernameTF)
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.delegate = self
        usernameTF.returnKeyType = .go
    
        autolayoutHelper.attatchScalably(anchor: usernameTF.topAnchor, to: logoImageView.bottomAnchor, constant: 48, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        autolayoutHelper.attatchScalably(anchor: usernameTF.centerXAnchor, to: view.centerXAnchor, constant: 0, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(to: usernameTF, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: true, for: [.CompactRegular, .RegularRegularPortrait])
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(to: usernameTF, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: false, for: [.RegularRegularLandscape])
        
        //constraints for landscape
        
        autolayoutHelper.attatchScalably(anchor: usernameTF.trailingAnchor, to: view.safeAreaLayoutGuide.trailingAnchor, constant: -20, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        autolayoutHelper.attatchScalably(anchor: usernameTF.centerYAnchor, to: view.safeAreaLayoutGuide.centerYAnchor, constant: -50, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        autolayoutHelper.addViewSizeConstrainsGuidedByHeight(to: usernameTF, with: CGSize(width: 400, height: 50), designOrientationIsPortrait: false, for: [.CompactCompact,.RegularCompact])
       
    }
    
    private func configureGetFollowersButton(){
        view.addSubview(getFollowersButton)
        
        getFollowersButton.addTarget(self, action: #selector(pushFollowesListVC), for: .touchUpInside)
        
        getFollowersButton.translatesAutoresizingMaskIntoConstraints = false
        autolayoutHelper.attatchScalably(anchor: getFollowersButton.bottomAnchor, to: view.safeAreaLayoutGuide.bottomAnchor, constant: -50, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        autolayoutHelper.attatchScalably(anchor: getFollowersButton.centerXAnchor, to: view.centerXAnchor, constant: 0, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(to: getFollowersButton, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: true, for: [.CompactRegular, .RegularRegularPortrait])
        autolayoutHelper.addViewSizeConstrainsGuidedByWidth(to: getFollowersButton, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: false, for: [.RegularRegularLandscape])
        
        
        autolayoutHelper.attatchScalably(anchor: getFollowersButton.trailingAnchor, to: view.safeAreaLayoutGuide.trailingAnchor, constant: -20, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        autolayoutHelper.attatchScalably(anchor: getFollowersButton.centerYAnchor, to: view.safeAreaLayoutGuide.centerYAnchor, constant: 50, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        autolayoutHelper.addViewSizeConstrainsGuidedByHeight(to: getFollowersButton, with: CGSize(width: 400, height: 50), designOrientationIsPortrait: false, for: [.CompactCompact,.RegularCompact])
    }

}

extension SearchVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pushFollowesListVC()
        return true
    }
}
