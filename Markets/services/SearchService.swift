//
//  SearchService.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation



class SearchService {
    static let instance = SearchService()
    
    @Published var collectionItems: [CollectionData] = [
        CollectionData(collectionAsset: "nft1", trendingImageAsset: "trending1", collectionName: "8SIAN Collection", trendingAssetName: "Alethea_AI"),
        CollectionData(collectionAsset: "nft2", trendingImageAsset: "trending2", collectionName: "8SIAN Collection", trendingAssetName: "Neon"),
        
        CollectionData(collectionAsset: "nft3", trendingImageAsset: "trending3", collectionName: "8SIAN Collection", trendingAssetName: "Northy"),
        CollectionData(collectionAsset: "nft4", trendingImageAsset: "trending4", collectionName: "8SIAN Collection", trendingAssetName: "Ropetho"),

    ]
    
    
    private init() {
        
    }
}



