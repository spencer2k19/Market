//
//  WalletManageViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 17/08/2023.
//

import Foundation
import Combine


class WalletManageViewModel {
    @Published var accounts: [WalletTypeData] = []
    @Published var inProgress: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    let service = WalletService.instance
    
    init() {
        service.fetchAccounts()
        inProgress = true
        accountsSubscription()
    }
    
    private func accountsSubscription() {
        service.$accounts.sink { [weak self] returnedAccounts in
            self?.accounts = returnedAccounts
            self?.inProgress = returnedAccounts.isEmpty
        }
        .store(in: &cancellables)
    }
    
}
