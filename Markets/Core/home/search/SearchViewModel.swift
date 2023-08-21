//
//  SearchViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 21/08/2023.
//

import Foundation
import Combine

class SearchViewModel {
    @Published var collectionItems: [CollectionData] = []
    @Published var searchText = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    private let service = SearchService.instance
    
    
    init() {
        addSubscriber()
    }
    
    private func addSubscriber() {
        
        
        $searchText.combineLatest(service.$collectionItems)
            .debounce(for: .seconds(0.5) , scheduler: DispatchQueue.main)
            .map { search, data in
                return self.filterCollections(with: search, data: data)
            }
            .sink { [weak self] returnedCollectionItems in
                self?.collectionItems = returnedCollectionItems
            }
            .store(in: &cancellables)
        
        
    }
    
    
    func filterCollections(with searchContent: String, data: [CollectionData]) -> [CollectionData] {
        
        guard !searchContent.isEmpty else {
            collectionItems = service.collectionItems
            return data
        }
        
        return data.filter { collectionItem in
            collectionItem.trendingAssetName.lowercased().contains(searchContent) ||
            collectionItem.collectionName.lowercased().contains(searchContent)
        }
        
    }
    
    func onSearch(with content: String) {
        searchText = content
    }
    
    
    func onClear() {
        searchText = ""
    }
}
