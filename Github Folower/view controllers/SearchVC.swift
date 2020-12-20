//
//  SearchVC.swift
//  Github Folower
//
//  Created by MAC on 10/7/20.
//

import UIKit

class SearchVC: ViewControllerWithAutoLayoutHelper {
    let logoImageView = UIImageView()
    let usernameTF = RoundedTextField(placeholder: "Enter a Username")
    let getFollowersButton = RoundedButton(backgroungColor: .systemGreen, title: "Get Followers")
    
    private var isUsernameEntered: Bool {
        guard let usernameTFText = usernameTF.text else {return false}
        return !usernameTFText.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureUsernameTF()
        configureGetFollowersButton()
        layoutHelper.startLayout()
        createDismissKeyboardTapGeature(to: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGeature(to view: UIView) {
        let dismissKeyboardTapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(dismissKeyboardTapGesture)
    }
    
    @objc func pushFollowesListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀.", buttontitle: "Ok")
            return
        }
        let followersListVC = FollowerListVC()
        followersListVC.userName = usernameTF.text
        followersListVC.title = usernameTF.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // add constraint for potrait mode
        var sizeClsses: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .regularRegularPortrait, .regularRegularLandscape]
        layoutHelper.attatchScaledToWidth(anchor: logoImageView.topAnchor, to: view.topAnchor, constant: 80, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: logoImageView.centerXAnchor, toAnchor: view.centerXAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: logoImageView, with: CGSize(width: 200, height: 200), designOrientationIsPortrait: true, for: [.compactRegular, .regularRegularPortrait])
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: logoImageView, with: CGSize(width: 200, height: 200), designOrientationIsPortrait: false, for: [.regularRegularLandscape])
        
        // for landscape
        sizeClsses = [.compactCompact, .regularCompact]
        layoutHelper.attatchScaledToHeight(anchor: logoImageView.leadingAnchor, to: view.safeAreaLayoutGuide.leadingAnchor, constant: 80, for: sizeClsses, designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: logoImageView.centerYAnchor, to: view.safeAreaLayoutGuide.centerYAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: false)
        layoutHelper.addViewSizeConstrainsGuidedByHeight(to: logoImageView, with: CGSize(width: 200, height: 200), designOrientationIsPortrait: false, for: [.compactCompact, .regularCompact])
    }
    
    private func configureUsernameTF() {
        view.addSubview(usernameTF)
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.delegate = self
        usernameTF.returnKeyType = .go
        var sizeClsses: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .regularRegularPortrait, .regularRegularLandscape]
        layoutHelper.attatchScaledToWidth(anchor: usernameTF.topAnchor, to: logoImageView.bottomAnchor, constant: 48, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: usernameTF.centerXAnchor, toAnchor: view.centerXAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: usernameTF, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: true, for: [.compactRegular, .regularRegularPortrait])
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: usernameTF, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: false, for: [.regularRegularLandscape])
        
        // constraints for landscape
        sizeClsses = [.compactCompact, .regularCompact]
        layoutHelper.attatchScaledToHeight(anchor: usernameTF.trailingAnchor, to: view.safeAreaLayoutGuide.trailingAnchor, constant: -20, for: sizeClsses, designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: usernameTF.centerYAnchor, to: view.safeAreaLayoutGuide.centerYAnchor, constant: -50, for: sizeClsses, designOrientationIsPortrait: false)
        layoutHelper.addViewSizeConstrainsGuidedByHeight(to: usernameTF, with: CGSize(width: 400, height: 50), designOrientationIsPortrait: false, for: [.compactCompact, .regularCompact])
       
    }
    
    private func configureGetFollowersButton() {
        view.addSubview(getFollowersButton)
        
        getFollowersButton.addTarget(self, action: #selector(pushFollowesListVC), for: .touchUpInside)
        
        getFollowersButton.translatesAutoresizingMaskIntoConstraints = false
        var sizeClsses: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .regularRegularPortrait, .regularRegularLandscape]
        layoutHelper.attatchScaledToWidth(anchor: getFollowersButton.bottomAnchor, to: view.safeAreaLayoutGuide.bottomAnchor, constant: -50, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: getFollowersButton.centerXAnchor, toAnchor: view.centerXAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        sizeClsses = [.compactRegular, .regularRegularPortrait]
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: getFollowersButton, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: true, for: sizeClsses)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: getFollowersButton, with: CGSize(width: 314, height: 50), designOrientationIsPortrait: false, for: [.regularRegularLandscape])
        
        sizeClsses = [.compactCompact, .regularCompact]
        layoutHelper.attatchScaledToHeight(anchor: getFollowersButton.trailingAnchor, to: view.safeAreaLayoutGuide.trailingAnchor, constant: -20, for: sizeClsses, designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: getFollowersButton.centerYAnchor, to: view.safeAreaLayoutGuide.centerYAnchor, constant: 50, for: sizeClsses, designOrientationIsPortrait: false)
        layoutHelper.addViewSizeConstrainsGuidedByHeight(to: getFollowersButton, with: CGSize(width: 400, height: 50), designOrientationIsPortrait: false, for: [.compactCompact, .regularCompact])
    }

}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pushFollowesListVC()
        return true
    }
}
