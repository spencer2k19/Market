//
//  AssetsViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 25/07/2023.
//

import UIKit



class AssetsViewController: WalletPagerViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var assets: [AssetData] = [
        AssetData(imageAsset: "btc", priceAsset: "35,908 BTC", priceConverted: "$5,348,156,547",
                  priceUser: "$20,556,2", variation: "+4.45%"),
        
        AssetData(imageAsset: "ethereum", priceAsset: "33,790 ETH", priceConverted: "$3,578,425,412",
                  priceUser: "$11,21", variation: "+1.81%"),
        
        AssetData(imageAsset: "ltc", priceAsset: "11,981 LTC", priceConverted: "$2,721,989,499",
                  priceUser: "$52.94", variation: "-3.14%"),
        
        AssetData(imageAsset: "doge", priceAsset: "655 DOGE", priceConverted: "$1,026,291,589",
                  priceUser: "$1,128,18", variation: "-8.85%")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AssetCell", bundle: nil), forCellReuseIdentifier: AssetCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset.bottom = 40
    }
}

//MARK: - Setup Table
extension AssetsViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assets.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AssetCell.identifier, for: indexPath) as? AssetCell {
            cell.assetData = self.assets[indexPath.row]
            return cell
        }
        
        return AssetCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
