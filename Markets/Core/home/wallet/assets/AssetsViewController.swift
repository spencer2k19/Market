//
//  AssetsViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 25/07/2023.
//

import UIKit
import Combine



class AssetsViewController: PagerViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel: AssetsViewModel = AssetsViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "AssetCell", bundle: nil), forCellReuseIdentifier: AssetCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset.bottom = 40
        
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        subscriptions = [
            assetsSubscription(),
            progressSubscription(),
        ]
    }
    
    private func assetsSubscription() -> AnyCancellable {
        return viewModel.$assets
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
        }
    }
    
    private func progressSubscription() -> AnyCancellable {
        return viewModel.$inProgress.receive(on: DispatchQueue.main)
            .sink { [weak self] inProgress in
                
                if inProgress {
                    self?.progressView.startAnimating()
                } else {
                    self?.progressView.stopAnimating()
                }
            }
    }
}

//MARK: - Setup Table
extension AssetsViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.assets.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AssetCell.identifier, for: indexPath) as? AssetCell {
            cell.assetData = self.viewModel.assets[indexPath.row]
            return cell
        }
        
        return AssetCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
