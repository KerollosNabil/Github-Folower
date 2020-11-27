//
//  ItemInfoVC.swift
//  Github Folower
//
//  Created by MAC on 26/11/2020.
//

import UIKit

class ItemInfoVC: ViewControllerWithAutoLayoutHelper {

    var padding:CGFloat = 20
    
    let actionButton = RoundedButton()
    let infoItemViewOne = InfoItemView()
    let infoItemViewTwo = InfoItemView()
    
    private let infoItemsStackView = UIStackView()
    
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
        configureBackgroundView()
        configureSupviews()
    }
    
    private func configureBackgroundView(){
        view.layer.cornerRadius = 18 * layoutHelper.designCalculator.heightFraction(isPortrait: true)
        view.backgroundColor = .secondarySystemBackground
    }
    private func configureSupviews(){
        
        setupInfoItemsStackView()
        setupActionButton()
    }
    private func setupInfoItemsStackView(){
        layoutInfoItemsStackView()
        configureInfoItemsStackView()
    }
    private func configureInfoItemsStackView(){
        infoItemsStackView.axis = .horizontal
        infoItemsStackView.distribution = .equalSpacing
        
        
        
        infoItemsStackView.addArrangedSubview(infoItemViewOne)
        infoItemsStackView.addArrangedSubview(infoItemViewTwo)
    }
    private func layoutInfoItemsStackView(){
        view.addSubview(infoItemsStackView)
        infoItemsStackView.translatesAutoresizingMaskIntoConstraints = false
        layoutHelper.attatchScaledToWidth(anchor: infoItemsStackView.topAnchor, to: view.topAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: infoItemsStackView.leadingAnchor, to: view.leadingAnchor, constant: padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: infoItemsStackView.trailingAnchor, to: view.trailingAnchor, constant: -padding, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: infoItemsStackView.heightAnchor, equalconstant: 50, for: [.CompactRegular, .RegularRegularPortrait,.RegularRegularLandscape], designOrientationIsPortrait: true)
    }
    private func setupActionButton(){
        view.addSubview(actionButton)
        layoutHelper.attatchScaledToWidth(anchor: actionButton.bottomAnchor, to: view.bottomAnchor, constant: -padding, for: [.CompactRegular], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: actionButton.leadingAnchor, to: view.leadingAnchor, constant: padding, for: [.CompactRegular], designOrientationIsPortrait: true)
        layoutHelper.attatchScaledToWidth(anchor: actionButton.trailingAnchor, to: view.trailingAnchor, constant: -padding, for: [.CompactRegular], designOrientationIsPortrait: true)
        layoutHelper.addScaledToWidth(dimension: actionButton.heightAnchor, equalconstant: 46, for: [.CompactRegular], designOrientationIsPortrait: true)
    }

}
