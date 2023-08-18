//
//  StatsService.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation

class StatsService {
    static let instance = StatsService()
    @Published var statsData:[StatData] = []
    
    @Published  var activityData: [ActivityData] = []
    
    
    
    
    private init() {
       
    }
    
    func fetchStatsData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.statsData = [
            StatData(imageAsset: "ranking1", name: "Rick Wright", pseudo: "@WillieTanner", price: "15,103", variation: "+23,00%", coinImageAsset: "mdi_ethereum"),
            
            StatData(imageAsset: "ranking2", name: "Dr. Bonnie Barstow ", pseudo: "@MikeTorello", price: "10,815", variation: "+18,00%", coinImageAsset: "mdi_ethereum"),
            
            StatData(imageAsset: "ranking3", name: "Dori Doreau", pseudo: "@ThomasMagnum", price: "9,071", variation: "+15,00%", coinImageAsset: "mdi_ethereum"),
            
            StatData(imageAsset: "ranking4", name: "Lynn Tanner", pseudo: "@RickWright", price: "7,221", variation: "-32,00%", coinImageAsset: "mdi_ethereum"),
            
            
            StatData(imageAsset: "ranking5", name: "Thomas Magnum", pseudo: "@WillieTanner", price: "3,302", variation: "+36,00%", coinImageAsset: "btc"),
            
            ]
        }
    }
    
    func fetchActivityData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.activityData = [
            ActivityData(imageAsset: "nft1", username: "April Curtis", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
            
            ActivityData(imageAsset: "nft2", username: "Theodore T.C. Calvin", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
            
            ActivityData(imageAsset: "nft3", username: "Jonathan Higgins", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
            
            
            ActivityData(imageAsset: "nft4", username: "Hannibal Smith", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563"),
            
            ActivityData(imageAsset: "nft5", username: "Willie Tanner", assetName: "Bored Ape Yacht Club #553123", date: "2 hour ago", price: "5,4563")
            
            ]
        }
    }
}
