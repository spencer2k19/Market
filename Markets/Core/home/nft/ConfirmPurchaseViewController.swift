//
//  ConfirmPurchaseViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 05/08/2023.
//

import UIKit

class ConfirmPurchaseViewController: UIViewController {

    @IBOutlet weak var backContainer: UIView!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backContainer.layer.cornerRadius = backContainer.frame.width / 2
        // Do any additional setup after loading the view.
        backContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBackPressed(_:))))
        
        confirmButton.addTapGestureRecognizer {
            self.performSegue(withIdentifier: "showBidSuccessfull", sender: self)
        }
    }
    
    
    @objc func onBackPressed(_ sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
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
