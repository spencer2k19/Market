//
//  NftListCell.swift
//  Markets
//
//  Created by Loic HACHEME on 02/08/2023.
//

import UIKit

class NftListCell: UICollectionViewCell {
    static let identifier = "nftListCell"
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var number: UILabel!
    
    @IBOutlet private weak var favouriteNumber: UILabel!
    @IBOutlet private weak var timeContainer: UIView!
    
    @IBOutlet weak var container: UIView!
    
    
    var nftData: NftData? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        container.layer.borderColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1).cgColor
        container.layer.borderWidth = 1
        container.layer.cornerRadius = 3
        container.layer.shadowRadius = 25
        container.layer.shadowOffset = CGSize(width: 0, height: 10)
        container.layer.shadowColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.2).cgColor

        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3.0
        
        //time container
        timeContainer.layer.backgroundColor = UIColor.white.withAlphaComponent(0.35).cgColor
        timeContainer.layer.cornerRadius = 3
        timeContainer.layer.shadowRadius = 6
        timeContainer.layer.shadowColor = UIColor(red: 0.96, green: 0.88, blue: 1, alpha: 1).cgColor
        timeContainer.layer.shadowOffset = CGSize(width: 0, height: 4)
        timeContainer.layer.borderWidth = 1
        timeContainer.layer.borderColor = UIColor.white.withAlphaComponent(0.08).cgColor
        
        
    }
    
    private func updateCell() {
        if let data = nftData {
            imageView.image = UIImage(named: data.asset)
            nameLabel.text = data.name
            number.text = data.number
            price.text = data.price
            favouriteNumber.text = data.favoriteNumber
        }
    }

}
