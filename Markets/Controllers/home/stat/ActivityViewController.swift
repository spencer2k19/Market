//
//  ActivityViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 07/08/2023.
//

import UIKit

class ActivityViewController: PagerViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var activityData: [ActivityData] = [
    ActivityData(imageAsset: "nft1", username: "April Curtis", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
    
    ActivityData(imageAsset: "nft2", username: "Theodore T.C. Calvin", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
    
    ActivityData(imageAsset: "nft3", username: "Jonathan Higgins", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
    
    
    ActivityData(imageAsset: "nft4", username: "Hannibal Smith", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
    
    ActivityData(imageAsset: "nft5", username: "Willie Tanner", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createMainCollectionLayout()
        collectionView.register(UINib(nibName: "ActivityCell", bundle: nil), forCellWithReuseIdentifier: ActivityCell.identifier)
        
        
    }
    
    
    private func createMainCollectionLayout() -> UICollectionViewCompositionalLayout {
        
        UICollectionViewCompositionalLayout{ (section, _) -> NSCollectionLayoutSection in
            
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0)
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), subitems: [item])
            
            
            
            
            let listSection = NSCollectionLayoutSection(group: group)
            
            listSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 30, trailing: 15)
            return listSection
            
        }
    }

}


//MARK: - Collection view delegate and datasource

extension ActivityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activityData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCell.identifier, for: indexPath) as? ActivityCell {
            cell.activityData = activityData[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
}
