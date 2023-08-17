//
//  NftService.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation

class NftService {
    static let instance = NftService()
    @Published var popularNftData: [NftData] = [
        NftData(name: "Rebels-NightCard#", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft1",variation: "",user: "@jailyn1509"),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft2",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft3",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft4",variation: "",user: ""),
        NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft5",variation: "",user: ""),
      ]
    
    @Published var nftCollection: [NftData] = [
        NftData(name: "Bored Ape Yacht Club", number: "#56382", price: "5,4563", favoriteNumber: "10", asset: "collection1",variation: "+23,00%",user: "@jailyn1509"),
        NftData(name: "Dejah Zulauf", number: "#56382", price: "5,0157", favoriteNumber: "10", asset: "collection2",variation: "-31,20%",user: "@Dejah09"),
        NftData(name: "Jailyn Crona", number: "#56382", price: "5,4563", favoriteNumber: "10", asset: "collection3",variation: "+23,00%",user: "@Deroah56"),
       ]
    
    
    @Published var nftMarketData: [NftData] = []
    
    private init() {
        
    }
    
    func fetchNftMarketsData() {
        nftMarketData =  [
            NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft1",variation: "",user: ""),
            NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft2",variation: "",user: ""),
            NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft3",variation: "",user: ""),
            NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft4",variation: "",user: ""),
            NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft5",variation: "",user: ""),
            NftData(name: "Neon District... One Item", number: "#56382", price: "10.01", favoriteNumber: "10", asset: "nft6",variation: "",user: "")]
    }
    
}
