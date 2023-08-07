//
//  StatCell.swift
//  Markets
//
//  Created by Loic HACHEME on 07/08/2023.
//

import UIKit

class StatCell: UICollectionViewCell {
    
    static let identifier = "statCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pseudo: UILabel!
    @IBOutlet weak var numberField: UILabel!
    
    @IBOutlet weak var assetPrice: UILabel!
    
    @IBOutlet weak var variation: UILabel!
    
    
    @IBOutlet weak var assetImage: UIImageView!
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var coinAssetImage: UIImageView!
    
    
    var statData: StatData? {
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
        
        assetImage.clipsToBounds = true
        assetImage.layer.cornerRadius = assetImage.frame.width / 2
        
    }
    
    
    private func updateCell() {
        if let data = statData {
            nameLabel.text = data.name
            pseudo.text = data.pseudo
            assetPrice.text = data.price
            variation.text = data.variation
            assetImage.image = UIImage(named: data.imageAsset)
            coinAssetImage.image = UIImage(named: data.coinImageAsset)
            
            if data.variation.contains("-") {
                variation.textColor = .init(hex: "#DC2626")
            } else {
                variation.textColor = .init(hex: "#16A34A")
            }
            
        }
    }

}
