//
//  AvatarImageView.swift
//  Github Folower
//
//  Created by MAC on 11/9/20.
//

import UIKit

class AvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        layer.cornerRadius = 16
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = true
    }
    func downloadImage(from stringURL:String){
        guard let url = URL(string: stringURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
