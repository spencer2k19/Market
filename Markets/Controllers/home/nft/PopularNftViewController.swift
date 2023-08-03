//
//  PopularNftViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 31/07/2023.
//

import UIKit




class PopularNftViewController: PagerViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var popularNftData: [NftData] = [
        NftData(name: "Rebels-NightCard#", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft1",variation: "",user: "@jailyn1509"),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft2",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft3",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft4",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft5",variation: "",user: ""),
      ]
    
    var nftCollection: [NftData] = [
        NftData(name: "Bored Ape Yacht Club", number: "#56382", price: "5,4563", favoriteNumber: "10", asset: "collection1",variation: "+23,00%",user: "@jailyn1509"),
        NftData(name: "Dejah Zulauf", number: "#56382", price: "5,0157", favoriteNumber: "10", asset: "collection2",variation: "-31,20%",user: "@Dejah09"),
        NftData(name: "Jailyn Crona", number: "#56382", price: "5,4563", favoriteNumber: "10", asset: "collection3",variation: "+23,00%",user: "@Deroah56"),
       ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createMainCollectionLayout()
        
        collectionView.register(UINib(nibName: "PopularNftCell", bundle: nil), forCellWithReuseIdentifier: PopularNftCell.identifier)
        
      
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        
        collectionView.register(UINib(nibName: "NftCollectionCell", bundle: nil), forCellWithReuseIdentifier: NftCollectionCell.identifier)
        
    }
    
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
        
    }
    
    private func createMainCollectionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            
            if section == 0 {
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .absolute(230),
                        heightDimension: .absolute(300)
                    ),
                    subitem: item,
                    count: 1
                )
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
                let listSection = NSCollectionLayoutSection(group: group)
                listSection.orthogonalScrollingBehavior = .continuous
                
                listSection.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 30, trailing: 30)
                
                
                return listSection
            } else {
                
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)), subitems: [item])
                let listSection = NSCollectionLayoutSection(group: group)
                
                listSection.boundarySupplementaryItems = [
                    NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: NSCollectionLayoutSize(
                            widthDimension: .fractionalWidth(1),
                            heightDimension: .estimated(30)
                        ),
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top
                    )
                ]
                listSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 30, trailing: 8)
                return listSection
            }
        
        }
    }
    
    
    
   
}



//MARK: - Collection view delegate and datasource
extension PopularNftViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return popularNftData.count
        }
        return nftCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularNftCell.identifier, for: indexPath) as? PopularNftCell {
                cell.nftData = popularNftData[indexPath.row]
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftCollectionCell.identifier, for: indexPath) as? NftCollectionCell {
                cell.nftData = nftCollection[indexPath.row]
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return section == 0 ? CGSizeZero : CGSize(width: collectionView.bounds.width, height: 70)
//    }
//
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
     
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 1 {
                if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView {
                    return headerView
                }


            }
        default:
            break
        }

        return UICollectionReusableView()


    }
    
    
}
 
    
    

