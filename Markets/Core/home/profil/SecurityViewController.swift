//
//  SecurityViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 09/08/2023.
//

import UIKit

class SecurityViewController: UIViewController {
    
    @IBOutlet weak var backContainer: UIView!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var loginDetailsContainer: UIView!
    
    @IBOutlet weak var securityContainer: UIView!
    
    @IBOutlet weak var googleContainer1: UIView!
    
    @IBOutlet weak var googleContainer2: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupView()
    }
    

    private func setupView() {
        loginDetailsContainer.layer.cornerRadius = 6
        securityContainer.layer.cornerRadius = 6
        
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        backContainer.layer.cornerRadius = backContainer.frame.width / 2
        
        
       setupGoogleContainer(container: googleContainer1)
       setupGoogleContainer(container: googleContainer2)
        
        backContainer.addTapGestureRecognizer {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    private func setupGoogleContainer(container: UIView) {
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor(hex: "#E6E6E6").cgColor
        container.layer.cornerRadius = container.frame.width / 2
    }

}
