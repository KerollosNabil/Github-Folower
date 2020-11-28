//
//  UserInfoHeaderVC.swift
//  Github Folower
//
//  Created by MAC on 22/11/2020.
//

import UIKit

class UserInfoHeaderVC: ViewControllerWithAutoLayoutHelper {
    
    let avatarImageView = AvatarImageView(frame: .zero)
    let userNameLabel = TitleLabel(textAlignment: .left)
    let nameLabel = SecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = SecondaryTitleLabel(fontSize: 18)
    let bioLabel = BodyLabel(textAlignment: .left)
    
    var user:User
    
    init(user:User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSupViews()
        layoutSubviews()
        configureUiElements()
        layoutHelper.startLayout()
    }
    private func addSupViews(){
        view.addSubview(avatarImageView)
        view.addSubview(userNameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(locationImageView)
        view.addSubview(bioLabel)
    }
    
    private func configureUiElements(){
        avatarImageView.downloadImage(from: user.avatarUrl)
        userNameLabel.text = user.login
        nameLabel.text = user.name
        nameLabel.fitText = true
        locationLabel.text = user.location ?? "No Location"
        locationLabel.fitText = true
        bioLabel.text = user.bio ?? "No Bio Available"
        bioLabel.numberOfLines = 3
        bioLabel.fitText = true
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        
    }

    private func layoutSubviews(){
        let pading:CGFloat = 0
        let textToImagePading:CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.attatchScaledToWidth(anchor: avatarImageView.topAnchor, to: view.topAnchor, constant: pading, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: avatarImageView.leadingAnchor, to: view.leadingAnchor, constant: pading, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: avatarImageView, with: CGSize(width: 90, height: 90), designOrientationIsPortrait: true, for: [.CompactRegular, .CompactCompact,. RegularCompact])
        
        layoutHelper.attatchScaledToWidth(anchor: userNameLabel.topAnchor, to: avatarImageView.topAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: userNameLabel.leadingAnchor, to: avatarImageView.trailingAnchor, constant: textToImagePading, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: userNameLabel.trailingAnchor, to: view.trailingAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: userNameLabel.heightAnchor, equalconstant: 38, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        
        layoutHelper.attatchScaledToWidth(anchor: nameLabel.centerYAnchor, to: avatarImageView.centerYAnchor, constant: 8, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: nameLabel.leadingAnchor, to: avatarImageView.trailingAnchor, constant: textToImagePading, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: nameLabel.trailingAnchor, to: view.trailingAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: nameLabel.heightAnchor, equalconstant: 20, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        
        layoutHelper.attatchScaledToWidth(anchor: locationImageView.bottomAnchor, to: avatarImageView.bottomAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: locationImageView.leadingAnchor, to: avatarImageView.trailingAnchor, constant: textToImagePading, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: locationImageView, with: CGSize(width: 20, height: 20), designOrientationIsPortrait: true, for: [.CompactRegular, .CompactCompact,. RegularCompact])
        
        layoutHelper.attatchScaledToWidth(anchor: locationLabel.centerYAnchor, to: locationImageView.centerYAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: locationLabel.leadingAnchor, to: locationImageView.trailingAnchor, constant: 5, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: locationLabel.trailingAnchor, to: view.trailingAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: locationLabel.heightAnchor, equalconstant: 20, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        
        layoutHelper.attatchScaledToWidth(anchor: bioLabel.topAnchor, to: avatarImageView.bottomAnchor, constant: textToImagePading, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: bioLabel.leadingAnchor, to: avatarImageView.leadingAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: bioLabel.trailingAnchor, to: view.trailingAnchor, constant: 0, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: bioLabel.bottomAnchor, to: view.bottomAnchor, constant: pading, for: [.CompactRegular, .CompactCompact,. RegularCompact], designOrientationIsPortrait: true)
    }
    

}
