//
//  FollowerListCV.swift
//  Github Folower
//
//  Created by MAC on 10/16/20.
//

import UIKit

class FollowerListVC: DataLoadingViewController {
    
    enum Section{
        case main
    }
    
    var followers:[Follower] = []
    var userName:String!
    var collectionView:UICollectionView!
    var dataSorce:UICollectionViewDiffableDataSource<Section, Follower>!
    private var page = 1
    private var hasMoreFollowers = true
    private var filteredFollowers:[Follower] = []
    private var isFiltering = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        getFollowers(page: page)
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
        collectionView.delegate = self
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
    
    private func getFollowers(page:Int){
        showLoadingView()
        NetworkManager.shared.getFollowers(for: userName, page: page) {[weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result{
            case .failure(let error): self.presentGFAlertOnMainThread(title: "bad stuff haperns", message: error.rawValue, buttontitle: "Ok")
            case .success(let followers):
                if followers.count < 100 {self.hasMoreFollowers = false}
                self.followers.append(contentsOf: followers)
                if self.followers.isEmpty {
                    DispatchQueue.main.async {
                        self.navigationItem.hidesSearchBarWhenScrolling = true
                        self.showEmptyStateView(with: "This user does not have any followers, Go follow him 😀")
                    }
                    return
                }
                self.updateData(for: self.followers)
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
    
    private func updateData(for followers : [Follower]){
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSorce.apply(snapShot, animatingDifferences: true)
        }
    }
    
    private func configureSearchController(){
        let searchControler = UISearchController()
        searchControler.searchResultsUpdater = self
        searchControler.searchBar.placeholder = "Search for a username"
        searchControler.obscuresBackgroundDuringPresentation = false
        searchControler.searchBar.delegate = self
        navigationItem.searchController = searchControler
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
extension FollowerListVC:UICollectionViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        if offsetY > contentHeight - scrollViewHeight - scrollViewHeight*0.5{
            guard hasMoreFollowers else {return}
            page += 1
            self.getFollowers(page: page)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let followersArray = isFiltering ? filteredFollowers : followers
        let follower = followersArray[indexPath.item]
        
        let destVC = UserInfoVC(user:follower)
        present(destVC.embedInNavigationController(), animated: true)
    }
}
extension FollowerListVC:UISearchResultsUpdating, UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            isFiltering = false
            return
            
        }
        isFiltering = true
        filteredFollowers = followers.filter{$0.login.lowercased().contains(filter.lowercased())}
        updateData(for: filteredFollowers)
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isFiltering = false
        updateData(for: followers)
    }
}
