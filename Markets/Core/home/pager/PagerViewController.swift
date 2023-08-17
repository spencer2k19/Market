//
//  WalletPageController.swift
//  Markets
//
//  Created by Loic HACHEME on 26/07/2023.
//

import UIKit


protocol PagerNftAssetDelegate {
    func onViewAssetDetails()
}


class PagerViewController: UIViewController {
    var pageIndex: Int = 0
    var pagerDelegate:PagerNftAssetDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

 

}
