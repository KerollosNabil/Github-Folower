//
//  FollowerListCV.swift
//  Github Folower
//
//  Created by MAC on 10/16/20.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section{
        case main
    }
    
    var followers:[Follower] = []
    var userName:String!
    var collectionView:UICollectionView!
    var dataSorce:UICollectionViewDiffableDataSource<Section, Follower>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.reloadCollectionViewLayout(self.view.bounds.size.width)
    }
    
    private func configureViewController(){
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView(){
        collectionView = createGFFollowersCollectionView()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createGFFollowersCollectionView()->UICollectionView{
        let cellAcpectRatio:CGFloat = 1.1
        let constant:CGFloat = 12
        let desplayMode:CollectionDisplay = .grid(columns: 3, aspectRatio: cellAcpectRatio, constant: constant)
        let layout = GFFlowLayout(display: desplayMode, containerWidth: view.bounds.width, minimumLineSpacing: 12, minimumInteritemSpacing: 10)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }

    private func reloadCollectionViewLayout(_ width: CGFloat) {
        if let flowLayout = collectionView.collectionViewLayout as? GFFlowLayout{
            flowLayout.containerWidth = width
            flowLayout.display = self.view.traitCollection.verticalSizeClass == .regular ? CollectionDisplay.grid(columns: 3, aspectRatio: 1.1, constant: 12) : CollectionDisplay.grid(columns: 5, aspectRatio: 1.1, constant: 12)
        }

    }
    
    private func getFollowers(){
        NetworkManager.shared.getFollowers(for: userName, page: 1) {[weak self] result in
            guard let self = self else { return }
            switch result{
            case .failure(let error): self.presentGFAlertOnMainThread(title: "bad stuff haperns", message: error.rawValue, buttontitle: "Ok")
            case .success(let followers):
                self.followers = followers
                self.updateData()
            }
        }
    }
    
    private func configureDataSource(){
        dataSorce = UICollectionViewDiffableDataSource<Section,Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as? FollowerCell
            cell?.set(follower: follower)
            
            return cell
        })
    }
    
    private func updateData(){
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSorce.apply(snapShot, animatingDifferences: true)
        }
    }

}
