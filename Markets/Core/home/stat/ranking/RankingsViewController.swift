//
//  RankingsViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 07/08/2023.
//

import UIKit
import Combine

class RankingsViewController: PagerViewController {

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    private let vm = RankingViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createMainCollectionLayout()
        
        collectionView.register(UINib(nibName: "StatCell", bundle: nil), forCellWithReuseIdentifier: StatCell.identifier)
        
        
        bindToViewModel()
        
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



//MARK: - View model subscriptions
extension RankingsViewController {
    private func bindToViewModel() {
        subscriptions = [
        loadingSubscription(),
        dataSubscriptions()
        ]
    }
    
    private func loadingSubscription() -> AnyCancellable {
        return vm.$isLoading.receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                isLoading ? self?.progressView.startAnimating() : self?.progressView.stopAnimating()
            }
    }
    
    private func dataSubscriptions() -> AnyCancellable {
        return vm.$statsData.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
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
        return vm.statsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatCell.identifier, for: indexPath) as? StatCell {
            cell.numberField.text = String(indexPath.row + 1)
            cell.statData = vm.statsData[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
