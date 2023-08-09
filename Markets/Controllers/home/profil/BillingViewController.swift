//
//  BillingViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 09/08/2023.
//

import UIKit

class BillingViewController: UIViewController {

    
    @IBOutlet weak var backContainer: UIView!
    
    
    @IBOutlet weak var dropboxContainer: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var extensionContainer: UIView!
    
    
    @IBOutlet weak var socialProfilesContainer: UIView!
    
    @IBOutlet weak var fbContainer: UIView!
    
    @IBOutlet weak var twitterContainer: UIView!
    
    
    @IBOutlet weak var instaContainer: UIView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupView()
    }
    
    private func setupView() {
        extensionContainer.layer.cornerRadius = 6
        socialProfilesContainer.layer.cornerRadius = 6
        
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        backContainer.layer.cornerRadius = backContainer.frame.width / 2
        
        
        setupSocialeContainer(container: dropboxContainer)
        setupSocialeContainer(container: fbContainer)
        setupSocialeContainer(container: twitterContainer)
        setupSocialeContainer(container: instaContainer)
        
        
        backContainer.addTapGestureRecognizer {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    private func setupSocialeContainer(container: UIView) {
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor(hex: "#E6E6E6").cgColor
        container.layer.cornerRadius = container.frame.width / 2
    }
    

 

}
