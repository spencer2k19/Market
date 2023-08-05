//
//  ConfirmPurchaseViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 05/08/2023.
//

import UIKit

class ConfirmPurchaseViewController: UIViewController {

    @IBOutlet weak var backContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backContainer.layer.cornerRadius = backContainer.frame.width / 2
        // Do any additional setup after loading the view.
        backContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBackPressed(_:))))
    }
    
    
    @objc func onBackPressed(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
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
