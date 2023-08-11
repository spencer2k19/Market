//
//  RankingsViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 07/08/2023.
//

import UIKit

class RankingsViewController: PagerViewController {

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var statsData:[StatData] = [
    StatData(imageAsset: "ranking1", name: "Rick Wright", pseudo: "@WillieTanner", price: "15,103", variation: "+23,00%", coinImageAsset: "mdi_ethereum"),
    
    StatData(imageAsset: "ranking2", name: "Dr. Bonnie Barstow ", pseudo: "@MikeTorello", price: "10,815", variation: "+18,00%", coinImageAsset: "mdi_ethereum"),
    
    StatData(imageAsset: "ranking3", name: "Dori Doreau", pseudo: "@ThomasMagnum", price: "9,071", variation: "+15,00%", coinImageAsset: "mdi_ethereum"),
    
    StatData(imageAsset: "ranking4", name: "Lynn Tanner", pseudo: "@RickWright", price: "7,221", variation: "-32,00%", coinImageAsset: "mdi_ethereum"),
    
    
    StatData(imageAsset: "ranking5", name: "Thomas Magnum", pseudo: "@WillieTanner", price: "3,302", variation: "+36,00%", coinImageAsset: "btc"),
    
    
    
    
    
    
    ]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createMainCollectionLayout()
        
        collectionView.register(UINib(nibName: "StatCell", bundle: nil), forCellWithReuseIdentifier: StatCell.identifier)
        
        
        
        
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
extension RankingsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pagerDelegate?.onViewAssetDetails()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatCell.identifier, for: indexPath) as? StatCell {
            cell.numberField.text = String(indexPath.row + 1)
            cell.statData = statsData[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
