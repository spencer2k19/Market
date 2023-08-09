//
//  AccountViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 09/08/2023.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var backContainer: UIView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    @IBOutlet weak var personalDetailsContainer: UIView!
    
    @IBOutlet weak var contactDetailsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    private func setupViews() {
        personalDetailsContainer.layer.cornerRadius = 6
        contactDetailsContainer.layer.cornerRadius = 6
        backContainer.layer.cornerRadius = backContainer.frame.width / 2
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        
        backContainer.addTapGestureRecognizer {
            self.navigationController?.popViewController(animated: true)
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
