//
//  TabCell.swift
//  Markets
//
//  Created by Loic HACHEME on 26/07/2023.
//

import UIKit

class TabCell: UICollectionViewCell {

    static let identifier = "tabCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.30) {
                
                self.titleLabel.textColor = self.isSelected ? UIColor.black : UIColor(hex: "#8C8C8C")
                self.titleLabel.font = self.isSelected ? .systemFont(ofSize: 14, weight: .medium) : .systemFont(ofSize: 14, weight: .regular)
            
                self.indicatorView.backgroundColor = self.isSelected ? UIColor(hex: "#2563EB") : UIColor.clear
            }

        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.text = ""
        indicatorView.backgroundColor = UIColor.clear
    }

}
