//
//  WalletService.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation

class WalletService {
    static let instance = WalletService()
    
    @Published var assets:[AssetData] = []
    @Published var accounts: [WalletTypeData] = []
    
    
    
    
    private init() {
       fetchAssets()
    }
    
    
    func fetchAccounts() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.accounts = [
                WalletTypeData(image: "metamask", accountName: "Metamask", totalValue: "$611,349,523", address: "0x33ecda5e...8b7c"),
                WalletTypeData(image: "coinbase", accountName: "Coinbase", totalValue: "$101,600,178", address: "0x33ecda5e...8b7c"),
                WalletTypeData(image: "rainbow", accountName: "Rainbow", totalValue: "$61,379,836", address: "0x33ecda5e...8b7c"),
            
            ]
        }
    }
    
    func fetchAssets() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.assets = [
                AssetData(imageAsset: "btc", priceAsset: "35,908 BTC", priceConverted: "$5,348,156,547",
                          priceUser: "$20,556,2", variation: "+4.45%"),
                
                AssetData(imageAsset: "ethereum", priceAsset: "33,790 ETH", priceConverted: "$3,578,425,412",
                          priceUser: "$11,21", variation: "+1.81%"),
                
                AssetData(imageAsset: "ltc", priceAsset: "11,981 LTC", priceConverted: "$2,721,989,499",
                          priceUser: "$52.94", variation: "-3.14%"),
                
                AssetData(imageAsset: "doge", priceAsset: "655 DOGE", priceConverted: "$1,026,291,589",
                          priceUser: "$1,128,18", variation: "-8.85%")
            
            ]
        }
        
    }
    
}
