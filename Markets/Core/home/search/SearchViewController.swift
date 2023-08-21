//
//  SearchViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 08/08/2023.
//

import UIKit
import Combine

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var containerTextField: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var resetSearch: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    private let vm = SearchViewModel()
    private var subscriptions = Set<AnyCancellable>()
    var recentSearchItems: [Category] = [
        Category(imageAsset: "category1", name: "Art"),
        Category(imageAsset: "category2", name: "Collectibles"),
        Category(imageAsset: "category3", name: "Domain"),
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
        
        
        //search
        searchTextField.addTarget(self, action: #selector(searchTextFieldDidChange(_:)), for: .editingChanged)
        
        
        resetSearch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClear(_:))))
        
        
        //view model
        bindToViewModel()
        
    }
    
    
    @objc func searchTextFieldDidChange(_ textField: UITextField) {
        if let content = textField.text {
            vm.onSearch(with: content)
        }
    }
    
    @objc func onClear(_ sender: UITapGestureRecognizer) {
        searchTextField.resignFirstResponder()
        searchTextField.text = ""
        vm.onClear()
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


//MARK: - Viewmodel subscribers
extension SearchViewController {
    private func bindToViewModel() {
        subscriptions = [collectionItemSubscription(), searchTextSubscription()]
    }
    
    private func collectionItemSubscription() -> AnyCancellable {
        return vm.$collectionItems.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
        
    }
    
    private func searchTextSubscription() -> AnyCancellable {
        return vm.$searchText.receive(on: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.resetSearch.isHidden = searchText.isEmpty
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
            return vm.collectionItems.count
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
                cell.collectionData = vm.collectionItems[indexPath.row]
                return cell
            }
        }
        
        
        return UICollectionViewCell()
    }
    
    
}
