//
//  PopularNftViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation
import Combine

class PopularNftViewModel {
    @Published var popularNftData: [NftData] = []
    @Published var nftCollection: [NftData] = []
    
    
    var cancellables = Set<AnyCancellable>()
    let service = NftService.instance
    
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        service.$nftCollection.sink { [weak self] returnedNftData in
            self?.nftCollection = returnedNftData
        }
        .store(in: &cancellables)
        
        service.$popularNftData.sink { [weak self] popularData in
            self?.popularNftData = popularData
        }
        .store(in: &cancellables)
        
        
    }
    
    
}
