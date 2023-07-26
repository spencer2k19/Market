//
//  AssetCell.swift
//  Markets
//
//  Created by Loic HACHEME on 26/07/2023.
//

import UIKit

class AssetCell: UITableViewCell {

    static let identifier = "assetCell"
    @IBOutlet weak var imageAsset: UIImageView!
    
    @IBOutlet weak var priceCoin: UILabel!
    
    @IBOutlet weak var priceConvertedAsset: UILabel!
    
    @IBOutlet weak var priceUserAsset: UILabel!
    
    var assetData: AssetData? {
        didSet {
            updateCell()
        }
    }
    
    @IBOutlet weak var variation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.assetData = nil
    }
    
    
    func updateCell() {
        if let asset = assetData {
        
            imageAsset.image = UIImage(named: asset.imageAsset)
            priceCoin.text = asset.priceAsset
            priceConvertedAsset.text = asset.priceConverted
            priceUserAsset.text = asset.priceUser
            variation.text = asset.variation
            if asset.variation.contains("-") {
                variation.textColor = .init(hex: "#DC2626")
            } else {
                variation.textColor = .init(hex: "#16A34A")
            }
        }
    }

   
    
}
