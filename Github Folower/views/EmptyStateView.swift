//
//  EmptyStateView.swift
//  Github Folower
//
//  Created by MAC on 15/11/2020.
//

import UIKit

class EmptyStateView: UIView {
    
    private let messageLabel = TitleLabel(textAlignment: .center)
    private let logoImageView = UIImageView()
    private var layoutHelper:AutolayoutHelper!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message:String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
        
    }
    
    private func configure(){
        print(self.bounds)
        layoutHelper =  AutolayoutHelper(designViewSizePortraitMode: CGSize(width: 414, height: 896), designView: self)
        setupImageView()
        setupMessageLabel()
        layoutHelper.startLayout()
    }
    private func setupImageView(){
        addSubview(logoImageView)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutHelper.attatchScalably(anchor: messageLabel.centerYAnchor, to: centerYAnchor, constant: -200, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScalably(anchor: messageLabel.centerXAnchor, to: centerXAnchor, constant: 0, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: messageLabel, with: CGSize(width: 334, height: 200), designOrientationIsPortrait: true, for:  [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape])
        
        // landscape
        layoutHelper.addViewSizeConstrainsGuidedByHeight(to: messageLabel, with: CGSize(width: 450, height: 300), designOrientationIsPortrait: false, for:  [.CompactCompact,.RegularCompact])
        layoutHelper.attatchScalably(anchor: messageLabel.centerYAnchor, to: centerYAnchor, constant: 0, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScalably(anchor: messageLabel.leadingAnchor, to: leadingAnchor, constant: 50, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        
    }
    private func setupMessageLabel(){
        addSubview(messageLabel)
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutHelper.addViewSizeConstrainsGuidedByWidth(to: logoImageView, with: CGSize(width: 500, height: 500), designOrientationIsPortrait: true, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape])
        layoutHelper.attatchScalably(anchor: logoImageView.trailingAnchor, to: trailingAnchor, constant: 170, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScalably(anchor: logoImageView.bottomAnchor, to: bottomAnchor, constant: 140, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        
        //landscape
        layoutHelper.addViewSizeConstrainsGuidedByHeight(to: logoImageView, with: CGSize(width: 600, height: 600), designOrientationIsPortrait: false, for: [.CompactCompact,.RegularCompact])
        layoutHelper.attatchScalably(anchor: logoImageView.trailingAnchor, to: trailingAnchor, constant: 170, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        layoutHelper.attatchScalably(anchor: logoImageView.bottomAnchor, to: bottomAnchor, constant: 100, for: [.CompactCompact,.RegularCompact], designOrientationIsPortrait: false)
        
    }
    
}
