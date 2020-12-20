//
//  EmptyStateView.swift
//  Github Folower
//
//  Created by MAC on 15/11/2020.
//

import UIKit

class EmptyStateView: UIViewWithAutoLayoutHellper {
    
    private let messageLabel = TitleLabel(textAlignment: .center)
    private let logoImageView = UIImageView()
    private var sizeClass: Set<DeviceSizeClassManager.DeviceSizeClass> = [.compactRegular, .regularRegularPortrait, .regularRegularLandscape]
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
        
    }
    
    private func configure() {
        print(self.bounds)
        setupImageView()
        setupMessageLabel()
        layoutHelper.startLayout()
    }
    private func setupImageView() {
        addSubview(logoImageView)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: logoImageView, with: CGSize(width: 500, height: 500), designOrientationIsPortrait: true, for: sizeClass)
        layoutHelper.attatchScaledToWidth(anchor: logoImageView.trailingAnchor, toAnchor: trailingAnchor, constant: 170, for: sizeClass, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: logoImageView.bottomAnchor, to: bottomAnchor, constant: 140, for: sizeClass, designOrientationIsPortrait: true)
        
        // landscape
        layoutHelper.addViewSizeConstrainsGuidedByHeight(to: logoImageView, with: CGSize(width: 450, height: 450), designOrientationIsPortrait: false, for: [.compactCompact, .regularCompact])
        layoutHelper.attatchScaledToWidth(anchor: logoImageView.trailingAnchor, toAnchor: trailingAnchor, constant: 170, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToWidth(anchor: logoImageView.bottomAnchor, to: bottomAnchor, constant: 100, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
    }
    private func setupMessageLabel() {
        addSubview(messageLabel)
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.attatchScaledToWidth(anchor: messageLabel.centerYAnchor, to: centerYAnchor, constant: -200, for: sizeClass, designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: messageLabel.centerXAnchor, toAnchor: centerXAnchor, constant: 0, for: sizeClass, designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: messageLabel, with: CGSize(width: 334, height: 200), designOrientationIsPortrait: true, for: sizeClass)
        
        // landscape
        layoutHelper.addViewSizeConstrainsGuidedByHeight(to: messageLabel, with: CGSize(width: 300, height: 300), designOrientationIsPortrait: false, for: [.compactCompact, .regularCompact])
        layoutHelper.attatchScaledToWidth(anchor: messageLabel.centerYAnchor, to: centerYAnchor, constant: 0, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScaledToWidth(anchor: messageLabel.leadingAnchor, toAnchor: leadingAnchor, constant: 50, for: [.compactCompact, .regularCompact], designOrientationIsPortrait: false)
        
    }
    
}
