//
//  CollectionCell.swift
//  Markets
//
//  Created by Loic HACHEME on 08/08/2023.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    static let identifier = "collectionCell"
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionAsset: UIImageView!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var assetName: UILabel!
    
    
    var collectionData: CollectionData? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        container.clipsToBounds = true
        container.backgroundColor = .white
        container.layer.cornerRadius = 8
        container.layer.shadowColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.2).cgColor
        container.layer.shadowRadius = 25
        container.layer.shadowOffset = CGSize(width: 0, height: 10)
        container.layer.borderColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1).cgColor
        container.layer.borderWidth = 1
        imageView.clipsToBounds = true
        collectionAsset.clipsToBounds = true
        collectionAsset.layer.cornerRadius = collectionAsset.frame.width / 2
        collectionAsset.layer.borderWidth = 2
        collectionAsset.layer.borderColor = UIColor.white.cgColor
        
        
        
    }
    
    private func updateCell() {
        if let data = collectionData {
            collectionAsset.image = UIImage(named: data.collectionAsset)
            imageView.image = UIImage(named: data.trendingImageAsset)
            collectionName.text = data.collectionName
            assetName.text = data.trendingAssetName
            
        }
    }

}
