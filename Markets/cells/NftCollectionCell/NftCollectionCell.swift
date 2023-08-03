//
//  NftCollectionCell.swift
//  Markets
//
//  Created by Loic HACHEME on 02/08/2023.
//

import UIKit

class NftCollectionCell: UICollectionViewCell {
    static let identifier = "nftCollectionCell"
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet weak var badgeContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var variation: UILabel!
    
    var nftData: NftData? {
        didSet {
            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        badgeContainer.clipsToBounds = true
        badgeContainer.layer.cornerRadius = badgeContainer.frame.width / 2
        
    }
    
    
    private func updateCell() {
        if let data = nftData {
            imageView.image = UIImage(named: data.asset)
            titleLabel.text = data.name
            pseudoLabel.text = data.user
            price.text = data.price
            variation.text = data.variation
            
            if data.variation.contains("-") {
                variation.textColor = .init(hex: "#DC2626")
            } else {
                variation.textColor = .init(hex: "#16A34A")
            }
        }
    }

}
