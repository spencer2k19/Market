//
//  WalletManageViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 27/07/2023.
//

import UIKit
import Combine

class WalletManageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    let viewModel = WalletManageViewModel()
    var subscriptions = Set<AnyCancellable>()

    
    
    
    @IBAction func addWalletClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAddWallet", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WalletTypeCell", bundle: nil), forCellReuseIdentifier: WalletTypeCell.identifier)
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = 170
        tableView.delegate = self
        bindToViewModel()

    }
    
    
    private func bindToViewModel() {
        subscriptions = [
            accountsSubscription(),
            loadingSubscription()
        
        ]
    }
    
    private func accountsSubscription() -> AnyCancellable {
        return viewModel.$accounts.receive(on: DispatchQueue.main)
            .sink { [weak self] returnedAccounts in
                self?.tableView.reloadData()
            }
    }
    
    private func loadingSubscription() -> AnyCancellable {
        return viewModel.$inProgress.receive(on: DispatchQueue.main)
            .sink { [weak self] inProgress in
                inProgress ? self?.progressView.startAnimating() : self?.progressView.stopAnimating()
            }
    }
    

}

//MARK: - Setup table
extension WalletManageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: WalletTypeCell.identifier, for: indexPath) as? WalletTypeCell {
            cell.walletTypeData = viewModel.accounts[indexPath.row]
            return cell
        }
        
        
        return WalletTypeCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
}
