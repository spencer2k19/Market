//
//  WalletManageViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 27/07/2023.
//

import UIKit

class WalletManageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var walletAccounts: [WalletTypeData] = [
        WalletTypeData(image: "metamask", accountName: "Metamask", totalValue: "$611,349,523", address: "0x33ecda5e...8b7c"),
        WalletTypeData(image: "coinbase", accountName: "Coinbase", totalValue: "$101,600,178", address: "0x33ecda5e...8b7c"),
        WalletTypeData(image: "rainbow", accountName: "Rainbow", totalValue: "$61,379,836", address: "0x33ecda5e...8b7c"),
    ]
    
    
    
    
    
    
    
    
    
    @IBAction func addWalletClicked(_ sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WalletTypeCell", bundle: nil), forCellReuseIdentifier: WalletTypeCell.identifier)
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 170
        tableView.delegate = self
        tableView.contentInset.bottom = 40

    }
    

}

//MARK: - Setup table
extension WalletManageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walletAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: WalletTypeCell.identifier, for: indexPath) as? WalletTypeCell {
            cell.walletTypeData = walletAccounts[indexPath.row]
            return cell
        }
        
        
        return WalletTypeCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
