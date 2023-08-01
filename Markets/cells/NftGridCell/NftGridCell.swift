//
//  NftGridCell.swift
//  Markets
//
//  Created by Loic HACHEME on 31/07/2023.
//

import UIKit

class NftGridCell: UICollectionViewCell {

    static let identifier = "nftGridCell"
    @IBOutlet weak var imageContent: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var favoriteNumber: UILabel!
    
    @IBOutlet weak var container: UIView!
    
    
    var nftData: NftData? {
        didSet {
            updateCell()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.borderColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1).cgColor
        container.layer.borderWidth = 1
        container.layer.cornerRadius = 3
        container.layer.shadowRadius = 25
        container.layer.shadowOffset = CGSize(width: 0, height: 10)
        container.layer.shadowColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.2).cgColor

        
        imageContent.clipsToBounds = true
        imageContent.layer.cornerRadius = 3.0
    
       
    }
    
    override func prepareForReuse() {
        self.nftData = nil
       
       
    }
    
    func updateCell() {
        if let data = nftData {
            imageContent.image = UIImage(named: data.asset)
            name.text = data.name
            number.text = data.number
            price.text = data.price
            favoriteNumber.text = data.favoriteNumber
        }
    }

}
