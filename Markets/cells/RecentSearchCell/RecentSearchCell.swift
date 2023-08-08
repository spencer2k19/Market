//
//  RecentSearchCell.swift
//  Markets
//
//  Created by Loic HACHEME on 08/08/2023.
//

import UIKit

class RecentSearchCell: UICollectionViewCell {

    static let identifier = "recentSearchCell"
    
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var categoryData: Category? {
        didSet {
            updateCell()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        container.layer.cornerRadius = 3
        
    }
    
    private func updateCell() {
        if let data = categoryData {
            imageView.image = UIImage(named: data.imageAsset)
            nameLabel.text = data.name
        }
    }

}
