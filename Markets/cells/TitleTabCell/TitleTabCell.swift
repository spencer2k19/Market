//
//  TitleTabCell.swift
//  Markets
//
//  Created by Loic HACHEME on 31/07/2023.
//

import UIKit

class TitleTabCell: UICollectionViewCell {
    
    static let identifier = "titleTabCell"

    @IBOutlet weak var titleLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.30) {
                
                self.titleLabel.textColor = self.isSelected ? UIColor.black : UIColor(hex: "#8C8C8C")
                self.titleLabel.font = self.isSelected ? .systemFont(ofSize: 17, weight: .bold) : .systemFont(ofSize: 18, weight: .bold)
            
                
                
            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.text = ""
    }
    
    
    override func prepareForReuse() {
        titleLabel.text = ""
    }

}
