//
//  SearchViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 08/08/2023.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var containerTextField: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var recentSearchItems: [Category] = [
        Category(imageAsset: "category1", name: "Art"),
        Category(imageAsset: "category2", name: "Collectibles"),
        Category(imageAsset: "category3", name: "Domain"),
    
    
    ]
    var collectionItems: [CollectionData] = [
        CollectionData(collectionAsset: "nft1", trendingImageAsset: "trending1", collectionName: "8SIAN Collection", trendingAssetName: "Alethea_AI"),
        CollectionData(collectionAsset: "nft2", trendingImageAsset: "trending2", collectionName: "8SIAN Collection", trendingAssetName: "Alethea_AI"),
        
        CollectionData(collectionAsset: "nft3", trendingImageAsset: "trending3", collectionName: "8SIAN Collection", trendingAssetName: "Alethea_AI"),
        CollectionData(collectionAsset: "nft4", trendingImageAsset: "trending4", collectionName: "8SIAN Collection", trendingAssetName: "Alethea_AI"),
    
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    

 
}

extension SearchViewController {
    private func setupViews() {
        //container search field
        containerTextField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        containerTextField.layer.cornerRadius = 4
        
        
        //collection view
        collectionView.layer.backgroundColor
        = UIColor.clear.cgColor
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCollectionLayout()
        
        collectionView.register(UINib(nibName: "RecentSearchCell", bundle: nil), forCellWithReuseIdentifier: RecentSearchCell.identifier)
        
        collectionView.register(UINib(nibName: "CategoryHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeaderView.identifier)
        
        
        
        collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: CollectionCell.identifier)
        
        collectionView.register(UINib(nibName: "TrendingCollectionView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TrendingCollectionView.identifier)
        
    }
    
    
    private func createCollectionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout{ (section, _) -> NSCollectionLayoutSection in
            
            if section == 0 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(150)), subitems: [item])
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                let supplement =   NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)),elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                supplement.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
                
                
                section.boundarySupplementaryItems = [
                  supplement
                    
                
                ]
                
                
                
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 30, trailing: 30)
                return section
                
                
            } else {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 15, trailing: 7)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(240)), subitems: [item])
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
              
                let listSection = NSCollectionLayoutSection(group: group)
                
                let supplement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                supplement.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
                
                
                listSection.boundarySupplementaryItems = [
                  supplement
                
                ]
                
                
                listSection.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 30, trailing: 10)
                return listSection
                
            }
            
        }
    }
}


//MARK: - Deleguate and datasource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return recentSearchItems.count
        } else {
            return collectionItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            self.performSegue(withIdentifier: "showDetailsAsset", sender: self)
        }
    }
    
    

    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 0 {
                if let categoryHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategoryHeaderView.identifier, for: indexPath) as? CategoryHeaderView {
                    return categoryHeader
                }
            } else if indexPath.section == 1  {
                if let trendingHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TrendingCollectionView.identifier, for: indexPath) as? TrendingCollectionView {
                    return trendingHeader
                }
            }
        default:
            break
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentSearchCell.identifier, for: indexPath) as? RecentSearchCell {
                cell.categoryData = recentSearchItems[indexPath.row]
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier, for: indexPath) as? CollectionCell {
                cell.collectionData = collectionItems[indexPath.row]
                return cell
            }
        }
        
        
        return UICollectionViewCell()
    }
    
    
}
