//
//  ActivityViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 18/08/2023.
//

import Foundation
import Foundation
import Combine

class ActivityViewModel {
    
    @Published var activityData: [ActivityData] = []
    @Published var isLoading = true
    
    
    private let service = StatsService.instance
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        service.fetchActivityData()
        addSubscribers()
    }
    
    private func addSubscribers() {
        service.$activityData.sink { [weak self] returnedActivityData in
            self?.activityData = returnedActivityData
            self?.isLoading = returnedActivityData.isEmpty
        }.store(in: &cancellables)
    }
}
