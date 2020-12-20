//
//  UserInfoVC.swift
//  Github Folower
//
//  Created by MAC on 21/11/2020.
//

import UIKit

class UserInfoVC: ViewControllerWithAutoLayoutHelper {
    
    var user: Follower
    
    var padding: CGFloat = 20
    
    private let headerInfoView = UIView()
    private let itemViewOne = UIView()
    private let itemViewTwo = UIView()
    private let dateLabel = BodyLabel(textAlignment: .center)

    init(user: Follower) {
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
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        title = user.login
    }
    
    private func getUserInfo() {
        NetworkManager.shared.getUser(for: user.login) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttontitle: "Ok")
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(chiledVC: UserInfoHeaderVC(user: user), to: self.headerInfoView)
                    self.add(chiledVC: RepoItemVC(user: user), to: self.itemViewOne)
                    self.add(chiledVC: FollowerItemVC(user: user), to: self.itemViewTwo)
                    self.dateLabel.text = "Github since \(self.convertDateToDisplayFormate(dateString: user.createdAt))"
                }
            }
        }
    }
    
    private func configureUI() {
        configureHeaderView()
        configureItemViewOne()
        configureItemViewTwo()
        configureDateLabel()
        layoutHelper.startLayout()
    }
    
    private func configureHeaderView() {
        view.addSubview(headerInfoView)
        headerInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.attatchScaledToWidth(anchor: headerInfoView.topAnchor, to: view.safeAreaLayoutGuide.topAnchor, constant: padding, for: [.compactRegular], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: headerInfoView.leadingAnchor, toAnchor: view.leadingAnchor, constant: padding, for: [.compactRegular], designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: headerInfoView, with: CGSize(width: 374, height: 180), designOrientationIsPortrait: true, for: [.compactRegular])
        
        // landscape
        let sizeClasses: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactCompact, .regularCompact]
        layoutHelper.attatchScaledToHeight(anchor: headerInfoView.centerYAnchor, to: view.centerYAnchor, constant: -50, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: headerInfoView.leadingAnchor, to: view.safeAreaLayoutGuide.leadingAnchor, constant: padding, for: sizeClasses, designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: headerInfoView.trailingAnchor, to: view.centerXAnchor, constant: -padding, for: sizeClasses, designOrientationIsPortrait: false)
        layoutHelper.addScaledToHeight(dimension: headerInfoView.heightAnchor, equalconstant: 200, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        
    }
    
    private func configureItemViewOne() {
        view.addSubview(itemViewOne)
        itemViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        var sizeCalsse: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .regularRegularPortrait, .regularRegularLandscape]
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.topAnchor, to: headerInfoView.bottomAnchor, constant: padding, for: sizeCalsse, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.leadingAnchor, toAnchor: view.leadingAnchor, constant: padding, for: sizeCalsse, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewOne.trailingAnchor, toAnchor: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding, for: sizeCalsse, designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: itemViewOne.heightAnchor, equalconstant: 145, for: sizeCalsse, designOrientationIsPortrait: true)
        
        // landscape
        sizeCalsse = [.compactCompact, .regularCompact]
        layoutHelper.attatchScaledToHeight(anchor: itemViewOne.bottomAnchor, to: view.centerYAnchor, constant: -padding/2, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: itemViewOne.leadingAnchor, to: view.centerXAnchor, constant: padding, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: itemViewOne.trailingAnchor, to: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding, for: sizeCalsse, designOrientationIsPortrait: false)
        layoutHelper.addScaledToHeight(dimension: itemViewOne.heightAnchor, equalconstant: 140, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
    }
    
    private func configureItemViewTwo() {
        view.addSubview(itemViewTwo)
        itemViewTwo.translatesAutoresizingMaskIntoConstraints = false
        let sizeClsses: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .regularRegularPortrait, .regularRegularLandscape]
        layoutHelper.attatchScaledToWidth(anchor: itemViewTwo.topAnchor, to: itemViewOne.bottomAnchor, constant: padding, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: itemViewTwo.centerXAnchor, toAnchor: view.centerXAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: itemViewTwo, with: CGSize(width: 374, height: 145), designOrientationIsPortrait: true, for: sizeClsses)
        
        // landscape
        
        layoutHelper.attatchScaledToHeight(anchor: itemViewTwo.topAnchor, to: itemViewOne.bottomAnchor, constant: padding, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: itemViewTwo.leadingAnchor, to: itemViewOne.leadingAnchor, constant: 0, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: itemViewTwo.trailingAnchor, to: itemViewOne.trailingAnchor, constant: 0, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.addScaledToHeight(dimension: itemViewTwo.heightAnchor, equalconstant: 140, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
    }
    private func configureDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.fitText = true
        var sizeClsses: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .regularRegularPortrait, .regularRegularLandscape]
        layoutHelper.attatchScaledToWidth(anchor: dateLabel.topAnchor, to: itemViewTwo.bottomAnchor, constant: padding, for: [.compactRegular], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: dateLabel.leadingAnchor, toAnchor: view.leadingAnchor, constant: padding, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: dateLabel.trailingAnchor, toAnchor: view.trailingAnchor, constant: -padding, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: dateLabel.heightAnchor, equalconstant: 25, for: sizeClsses, designOrientationIsPortrait: true)
        
        // landscape
        sizeClsses = [.compactCompact, .regularCompact]
        layoutHelper.attatchScaledToHeight(anchor: dateLabel.topAnchor, to: headerInfoView.bottomAnchor, constant: padding, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: dateLabel.leadingAnchor, to: headerInfoView.leadingAnchor, constant: 0, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToHeight(anchor: dateLabel.trailingAnchor, to: headerInfoView.trailingAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: false)
        layoutHelper.addScaledToHeight(dimension: dateLabel.heightAnchor, equalconstant: 25, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        
    }
    
    func convertDateToDisplayFormate(dateString: String) -> String {
        guard let date = dateString.convertToDate() else { return "N/A" }
        return date.dateStringWithFormat(format: "MMM yyyy")
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
