//
//  ActivityCell.swift
//  Markets
//
//  Created by Loic HACHEME on 07/08/2023.
//

import UIKit

class ActivityCell: UICollectionViewCell {
    
    static let identifier = "activityCell"
    
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var imageAsset: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameAsset: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    var activityData: ActivityData? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        container.layer.cornerRadius = 3
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        container.layer.shadowRadius = 30
        container.layer.shadowColor = UIColor(red: 0.65, green: 0.68, blue: 0.76 , alpha: 0.05).cgColor
        container.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    
    private func updateCell() {
        if let data = activityData {
            nameLabel.text = data.username
            imageAsset.image = UIImage(named: data.imageAsset)
            nameAsset.text = data.assetName
            date.text = data.date
            price.text = data.price
        }
    }

}
