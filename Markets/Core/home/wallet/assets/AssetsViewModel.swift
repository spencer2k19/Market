//
//  AssetsViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation
import Combine


class AssetsViewModel {
    @Published var assets:[AssetData] = []
    @Published var inProgress:Bool = false
    
    
    var cancellables = Set<AnyCancellable>()
    let service = WalletService.instance
    
    init() {
        addSubscribers()
        inProgress = true
    }
    
    private func addSubscribers() {
        service.$assets.sink { [weak self] returnedAssets in
            self?.assets = returnedAssets
            self?.inProgress = returnedAssets.isEmpty
        }
        .store(in: &cancellables)
    }
    
}
