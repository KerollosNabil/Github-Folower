//
//  infoItemView.swift
//  Github Folower
//
//  Created by MAC on 26/11/2020.
//

import UIKit

struct Info {
    var imageName: String
    var title: String
}

enum InfoTypes {
    case repos, gists, followers, following
    func getItemInfo() -> Info {
        switch self {
        case .repos:
            return Info(imageName: SFSymbols.repos, title: "Public Repos")
        case .gists:
            return Info(imageName: SFSymbols.gists, title: "Public Gists")
        case .followers:
            return Info(imageName: SFSymbols.followers, title: "Followers")
        case .following:
            return Info(imageName: SFSymbols.following, title: "Following")
        }
    }
}

class InfoItemView: UIViewWithAutoLayoutHellper {

    private let symbolImageView = UIImageView()
    private let titleLabel = TitleLabel(textAlignment: .left)
    private let countLabel = TitleLabel(textAlignment: .center)
    private let sizeClsses: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .compactCompact, . regularCompact]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureSympleImageView()
        configureTitleLabel()
        configureCountLabel()
    }
    private func configureSympleImageView() {
        addSubview(symbolImageView)
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.attatchScaledToWidth(anchor: symbolImageView.topAnchor, to: self.topAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: symbolImageView.leadingAnchor, toAnchor: self.leadingAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: symbolImageView, with: CGSize(width: 20, height: 20), designOrientationIsPortrait: true, for: sizeClsses)
        
    }
    private func configureTitleLabel() {
        addSubview(titleLabel)

        layoutHelper.attatchScaledToWidth(anchor: titleLabel.centerYAnchor, to: symbolImageView.centerYAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: titleLabel.leadingAnchor, toAnchor: symbolImageView.trailingAnchor, constant: 12, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: titleLabel.trailingAnchor, toAnchor: trailingAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: titleLabel.heightAnchor, equalconstant: 18, for: [.compactRegular, .compactCompact, . regularCompact], designOrientationIsPortrait: true)
    }
    private func configureCountLabel() {
        addSubview(countLabel)
        layoutHelper.attatchScaledToWidth(anchor: countLabel.topAnchor, to: symbolImageView.bottomAnchor, constant: 4, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: countLabel.leadingAnchor, toAnchor: leadingAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: countLabel.trailingAnchor, toAnchor: trailingAnchor, constant: 0, for: sizeClsses, designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: countLabel.heightAnchor, equalconstant: 18, for: [.compactRegular, .compactCompact, . regularCompact], designOrientationIsPortrait: true)
    }
    func set(itemInfoType: InfoTypes, count: Int) {
        let itemInfo = itemInfoType.getItemInfo()
        symbolImageView.image = UIImage(systemName: itemInfo.imageName)
        titleLabel.text = itemInfo.title
        countLabel.text = String(count)
    }
    
}
