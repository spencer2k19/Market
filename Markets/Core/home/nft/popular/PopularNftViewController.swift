//
//  PopularNftViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 31/07/2023.
//

import UIKit
import Combine




class PopularNftViewController: PagerViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel: PopularNftViewModel = PopularNftViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createMainCollectionLayout()
        
        collectionView.register(UINib(nibName: "PopularNftCell", bundle: nil), forCellWithReuseIdentifier: PopularNftCell.identifier)
        
      
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        
        collectionView.register(UINib(nibName: "NftCollectionCell", bundle: nil), forCellWithReuseIdentifier: NftCollectionCell.identifier)
        
        //viewmodel subscription
        bindToViewModel()
        
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
                
               let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.6),
                    heightDimension: .absolute(300)
                ), subitems: [item])
               
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
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


//MARK: - ViewModel subscription
extension PopularNftViewController {
    private func bindToViewModel() {
        subscriptions = [
        nftDataSubscription(),
        popularNftSubscription()
        
        ]
    }
    
    private func nftDataSubscription() -> AnyCancellable {
        return viewModel.$nftCollection.receive(on: DispatchQueue.main)
            .sink { [weak self] returnedNftData in
                self?.collectionView.reloadData()
            }
    }
    
    private func popularNftSubscription() -> AnyCancellable {
        return viewModel.$popularNftData.receive(on: DispatchQueue.main)
            .sink { [weak self] returnedPopularNftData in
                self?.collectionView.reloadData()
            }
    }
    
    
    
}



//MARK: - Collection view delegate and datasource
extension PopularNftViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.popularNftData.count
        }
        return viewModel.nftCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "detailsAssetVC") as! DetailsAssetViewController
//        detailsVC.modalPresentationStyle = .overFullScreen
//        self.present(detailsVC, animated: true)
        
        pagerDelegate?.onViewAssetDetails()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularNftCell.identifier, for: indexPath) as? PopularNftCell {
                cell.nftData = viewModel.popularNftData[indexPath.row]
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftCollectionCell.identifier, for: indexPath) as? NftCollectionCell {
                cell.nftData = viewModel.nftCollection[indexPath.row]
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
 
    
    

