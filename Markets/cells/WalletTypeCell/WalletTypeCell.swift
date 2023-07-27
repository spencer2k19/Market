//
//  WalletTypeCell.swift
//  Markets
//
//  Created by Loic HACHEME on 27/07/2023.
//

import UIKit

class WalletTypeCell: UITableViewCell {
static let identifier = "walletTypeCell"
    
    @IBOutlet weak var icone: UIImageView!
    @IBOutlet weak var walletName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    
    
    @IBOutlet weak var container: UIView!
    
    var walletTypeData: WalletTypeData? {
        didSet {
            updateCell()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.borderColor = UIColor(hex: "#E6E6E6").cgColor
        container.layer.borderWidth = 1.0
        container.layer.cornerRadius = 3
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.walletTypeData = nil
    }
    
    func updateCell() {
        if let walletType = walletTypeData {
            icone.image = UIImage(named: walletType.image)
            walletName.text = walletType.accountName
            address.text = walletType.address
            totalValue.text = walletType.totalValue
        }
    }
    
}
