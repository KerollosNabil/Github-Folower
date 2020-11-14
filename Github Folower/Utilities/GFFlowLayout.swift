//
//  GFFlowLayout.swift
//  Github Folower
//
//  Created by MAC on 11/12/20.
//

import UIKit

class GFFlowLayout: UICollectionViewFlowLayout {
    var display : CollectionDisplay = .list {
            didSet {
                
                self.invalidateLayout()
                
            }
        }

        var containerWidth: CGFloat = 0.0 {
            didSet {
                if containerWidth != oldValue {
                    self.invalidateLayout()
                }
            }
        }

    convenience init(display: CollectionDisplay, containerWidth: CGFloat, minimumLineSpacing:CGFloat = 10, minimumInteritemSpacing:CGFloat = 10) {
            self.init()

            self.display = display
            self.containerWidth = containerWidth
            self.minimumLineSpacing = minimumLineSpacing
            self.minimumInteritemSpacing = minimumInteritemSpacing
            self.configLayout()
        }

        func configLayout() {
            switch display {
            case .inline:
                self.scrollDirection = .horizontal
                self.itemSize = CGSize(width: containerWidth * 0.9, height: 300)

            case .grid(let column, let aspectRatio, let constant):
                self.scrollDirection = .vertical
                let spacing = CGFloat(column - 1) * minimumLineSpacing
                let optimisedWidth = (containerWidth - spacing) / CGFloat(column)
                let oprimisedHeight = optimisedWidth * aspectRatio + constant
                self.itemSize = CGSize(width: optimisedWidth , height: oprimisedHeight) // keep as square

            case .list:
                self.scrollDirection = .vertical
                self.itemSize = CGSize(width: containerWidth, height: 130)
            }
        }
    override func invalidateLayout() {
            super.invalidateLayout()
            self.configLayout()
        }

}

enum CollectionDisplay {
    case inline
    case list
    case grid(columns: Int, aspectRatio:CGFloat, constant:CGFloat)
}

