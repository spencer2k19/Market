//
//  MenuTabsView.swift
//  Markets
//
//  Created by Loic HACHEME on 24/07/2023.
//

import Foundation
import UIKit


protocol MenuBarDelegate {
    func menubarDidSelectItemAt(menu: MenuTabsView, index:Int)
}

class MenuTabsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource,
                    UICollectionViewDelegateFlowLayout{
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv  = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        layout.scrollDirection = .horizontal
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    var isSizeToFitCellsNeeded: Bool = false {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var dataArray: [String] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    
    var menuDelegate:MenuBarDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInitializer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInitializer()
    }
    
    
    
    private func customInitializer() {
        collectionView.register(UINib(nibName: "TabCell", bundle: nil), forCellWithReuseIdentifier: TabCell.identifier)
        addSubview(collectionView)
        addConstraintsWithFormatString(formate: "V:|[v0]|", views: collectionView)
        addConstraintsWithFormatString(formate: "H:|[v0]|", views: collectionView)
        backgroundColor = .clear
    }
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCell.identifier, for: indexPath) as? TabCell {
            cell.titleLabel.text = dataArray[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isSizeToFitCellsNeeded {
            let sizeee = CGSize.init(width: 500, height: self.frame.height)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let str = dataArray[indexPath.item]
            let estimatedRect = NSString.init(string: str).boundingRect(with: sizeee, options: options,attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23)], context: nil )
            return CGSize.init(width: estimatedRect.size.width, height: self.frame.height)
        }

        return CGSize.init(width: (self.frame.width - 10) / CGFloat(dataArray.count),
                           height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = Int(indexPath.item)
        menuDelegate?.menubarDidSelectItemAt(menu: self, index: index)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
    
    
}
