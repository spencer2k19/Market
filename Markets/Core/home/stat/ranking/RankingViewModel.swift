//
//  RankingViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 18/08/2023.
//

import Foundation
import Combine

class RankingViewModel {
    
    @Published var statsData: [StatData] = []
    @Published var isLoading = true
    
    
    private let service = StatsService.instance
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        service.fetchStatsData()
        addSubscribers()
    }
    
    private func addSubscribers() {
        service.$statsData.sink { [weak self] returnedStatsData in
            self?.statsData = returnedStatsData
            self?.isLoading = returnedStatsData.isEmpty
        }.store(in: &cancellables)
    }
}
