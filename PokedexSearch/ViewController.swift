//
//  ViewController.swift
//  PokedexSearch
//
//  Created by Enes Kaya on 3.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private enum ViewMetrics {
        static let bgColor = UIColor.systemBackground
        
        static let collectionViewBackgroundColor = UIColor.systemBackground
        static let collectionViewEdgeInsets = UIEdgeInsets(top: 12.0, left: 12.0, bottom: 12.0, right: 12.0)
        static let collectionViewMinimumItemSpacing: CGFloat = 10.0
        static let collectionViewExtraVerticalSpace: CGFloat = 30.0
    }
    enum Section {
        case main
    }
    
    var pokename: String!
    var poke: [poke] = []
    
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, poke>!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let balbazar = PokedexSearch.poke(name: "balbazar", avatarUrl: "poke")
        let balbazar2 = PokedexSearch.poke(name: "balbazar", avatarUrl: "poke")
        let balbazar3 = PokedexSearch.poke(name: "balbazar", avatarUrl: "poke")
        let balbazar4 = PokedexSearch.poke(name: "balbazar", avatarUrl: "poke")
        let balbazar5 = PokedexSearch.poke(name: "balbazar", avatarUrl: "poke")
        poke.append(balbazar)
        poke.append(balbazar2)
        poke.append(balbazar3)
        poke.append(balbazar4)
        poke.append(balbazar5)
        
        
        configureViewController()
        configureCollectionView()
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PokeCell.self, forCellWithReuseIdentifier: PokeCell.reuseID)
    }
    
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, poke>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeCell.reuseID, for: indexPath) as! PokeCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    
}


