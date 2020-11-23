//
//  FollowerCell.swift
//  Github Folower
//
//  Created by MAC on 11/9/20.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    private let avatarImageView = AvatarImageView(frame: .zero)
    private let usernameLabel = TitleLabel(textAlignment: .center)
    var follower:Follower?{
        didSet{
            usernameLabel.text = follower?.login
            avatarImageView.downloadImage(from: follower!.avatarUrl)
        }
    }
    var padding:CGFloat = 8
    var labelToImageRatio:CGFloat = 0.20
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(frame: CGRect, padding:CGFloat) {
        super.init(frame: frame)
        self.padding = padding
        configure()
    }
    
    func set(follower:Follower){
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        setupAvatarImage()
        setupUsernameLabel()
    }
    
    func setupAvatarImage(){
        addSubview(avatarImageView)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])
    }
    
    func setupUsernameLabel(){
        addSubview(usernameLabel)
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding*3/2),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: labelToImageRatio)
        ])
    }
}
