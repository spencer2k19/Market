//
//  SettingsViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 09/08/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var accountContainer: UIView!
    
    @IBOutlet weak var privacyContainer: UIView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var logoutBtn: UIButton!
    
    @IBOutlet weak var accountInformationContainer: UIView!
    
    @IBOutlet weak var notificationContainer: UIView!
    
    @IBOutlet weak var securityContainer: UIView!
    
    @IBOutlet weak var billingContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    

    private func setupView() {
        accountContainer.layer.cornerRadius = 6
        privacyContainer.layer.cornerRadius = 6
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2        
        logoutBtn.layer.shadowColor = UIColor.black.withAlphaComponent(0.04).cgColor
        logoutBtn.layer.cornerRadius = 6
        logoutBtn.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        accountInformationContainer.addTapGestureRecognizer {
            self.performSegue(withIdentifier: "goToAccount", sender: self)
        }
        
        
        securityContainer.addTapGestureRecognizer {
            self.performSegue(withIdentifier: "goToSecurity", sender: self)
        }
        
        billingContainer.addTapGestureRecognizer {
            self.performSegue(withIdentifier: "goToBilling", sender: self)
        }
        
        
        notificationContainer.addTapGestureRecognizer {
            self.performSegue(withIdentifier: "goToNotifications", sender: self)
        }
        
        logoutBtn.addTapGestureRecognizer {
            let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout ?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
                self.dismiss(animated: true)
            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel))
            
            self.present(alert, animated: true)
          
        }

    }

}
