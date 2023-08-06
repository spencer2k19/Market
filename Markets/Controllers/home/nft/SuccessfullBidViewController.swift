//
//  SuccessfullBidViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 06/08/2023.
//

import UIKit

class SuccessfullBidViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
       
    }
    
    
    
    @IBAction func onViewItem(_ sender: UIButton) {
        if let targetVC = navigationController?.viewControllers.first(where: {$0 is DetailsAssetViewController}) {
            navigationController?.popToViewController(targetVC, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
