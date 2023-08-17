//
//  MarketNftViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 31/07/2023.
//

import UIKit

class MarketNftViewController: PagerViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var formatImage: UIImageView!
    var currentLayout: DisplayType = .pellicule
    
    var data: [NftData] = [
    NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft1",variation: "",user: ""),
    NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft2",variation: "",user: ""),
    NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft3",variation: "",user: ""),
    NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft4",variation: "",user: ""),
    NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft5",variation: "",user: ""),
    NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft6",variation: "",user: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        let toggleLayoutRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleContentLayout(_:)))
        formatImage.isUserInteractionEnabled = true
        formatImage.addGestureRecognizer(toggleLayoutRecognizer)
    }
    
    
    @objc func toggleContentLayout(_ sender: UITapGestureRecognizer) {
        currentLayout =  currentLayout == .pellicule ? .list : .pellicule
        formatImage.image = currentLayout == .pellicule ? UIImage(systemName: "square.grid.2x2") : UIImage(systemName: "rectangle.grid.1x2")
       
        collectionView.reloadSections(IndexSet(integer: 0))
        collectionView.collectionViewLayout = createMainCollectionLayout()
        
    }
    


}

//MARK: - Init views
extension MarketNftViewController {
    private func setupViews() {
        collectionView.layer.backgroundColor = UIColor.clear.cgColor

        collectionView.register(UINib(nibName: "NftGridCell", bundle: nil), forCellWithReuseIdentifier: NftGridCell.identifier)
        collectionView.register(UINib(nibName: "NftListCell", bundle: nil), forCellWithReuseIdentifier: NftListCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = self.createMainCollectionLayout()
        
       
    }
}


//MARK: - Handle collection view
extension MarketNftViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "detailsAssetVC") as! DetailsAssetViewController
//        detailsVC.modalPresentationStyle = .overFullScreen
//        self.present(detailsVC,animated: true,completion: nil)
        pagerDelegate?.onViewAssetDetails()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(currentLayout == .pellicule) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftGridCell.identifier, for: indexPath) as? NftGridCell {
                cell.nftData = self.data[indexPath.row]
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftListCell.identifier, for: indexPath) as? NftListCell {
                cell.nftData = self.data[indexPath.row]
                return cell
            }
        }
      
        
        return UICollectionViewCell()
    }
    
    
    
    
    
//    func createCollectionLayout() -> UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 15
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        if(currentLayout == .pellicule) {
//            let spacing: CGFloat = 10 // Espace horizontal entre les cellules
//            let padding: CGFloat = 10 // Padding autour de la grille
//            let availableWidth = collectionView.bounds.width - (padding * 2)
//            let itemWidth = (availableWidth - spacing) / 2 // Deux éléments par ligne
//            layout.itemSize = CGSize(width: itemWidth, height: 290)
//        } else {
//            let padding: CGFloat = 10 // Padding autour de la grille
//            let availableWidth = collectionView.bounds.width - (padding * 2)
//            layout.itemSize = CGSize(width: availableWidth, height: 380)
//        }
//
//
//        return layout
//
//    }
    
    
    func createMainCollectionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection in
            
            if self.currentLayout == .pellicule {
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1/2),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7.5, bottom: 15, trailing: 7.5)
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(290)
                    ),
                    subitems: [item]
                )

                let listSection = NSCollectionLayoutSection(group: group)
                
                listSection.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 7.5, bottom: 200, trailing: 7.5)
                
                return listSection
            } else {
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7.5, bottom: 15, trailing: 7.5)
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(380)
                    ),
                    subitems: [item]
                )

                let listSection = NSCollectionLayoutSection(group: group)
                
                listSection.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 7.5, bottom: 200, trailing: 7.5)
                
                return listSection
            }
           
        }
    }
    
    
}



//MARK: - Flow layout
extension MarketNftViewController: UICollectionViewDelegateFlowLayout {
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let padding: CGFloat = 8 // Padding sur toute la grille
//               let spacing: CGFloat = 8 // Espacement entre les éléments
//               let availableWidth = collectionView.bounds.width - (padding * 2)
//               let itemWidth = (availableWidth - spacing) / 2 // Deux éléments par ligne
//               return CGSize(width: itemWidth, height: 290)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//    }
    
}
