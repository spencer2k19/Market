//
//  MarketViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation
import Combine

class MarketViewModel {
    @Published var nftData: [NftData] = []
    private var cancellables = Set<AnyCancellable>()
    private let service = NftService.instance
    
    
    
    init() {
        service.fetchNftMarketsData()
        addSubscribers()
    }
    
    private func addSubscribers() {
        service.$nftMarketData.sink { [weak self] returnedNftData in
            self?.nftData = returnedNftData
        }
        .store(in: &cancellables)
    }
}
