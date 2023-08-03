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
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft1",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft2",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft3",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft4",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft5",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft6",variation: "",user: "")]
    
    var nftCollection: [NftData] = [
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft1",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft2",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft3",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft4",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft5",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft6",variation: "",user: "")]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCollectionLayout()
        
        collectionView.register(UINib(nibName: "PopularNftCell", bundle: nil), forCellWithReuseIdentifier: PopularNftCell.identifier)
        
      
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        
        collectionView.register(UINib(nibName: "NftCollectionCell", bundle: nil), forCellWithReuseIdentifier: NftCollectionCell.identifier)
        
    }
    
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
        
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
    

    
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            if indexPath.section == 1 {
//                if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView {
//                    return headerView
//                }
//
//
//            }
//        default:
//            break
//        }
//
//        return UICollectionReusableView()
//
//
//    }
    
    
}


extension PopularNftViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if indexPath.section == 0 {
                return CGSize(width: 230, height: 300)
            } else {
                return CGSize(width: collectionView.bounds.width, height: 150)
            }
         
        }
    
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 8
        }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        }
    
    
    
    
    
}
