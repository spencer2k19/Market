//
//  LoginViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 18/07/2023.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    
    @IBAction func login(_ sender: UIButton) {
        showHome()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    private func initViews() {
        
        emailView.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        emailView.layer.borderWidth = 1.0
        emailView.layer.cornerRadius = 5.0
        
        passwordView.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.cornerRadius = 5.0
    }
    
    private func showHome() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let homeTabVC = storyBoard.instantiateViewController(withIdentifier: "homeTabVC")
        homeTabVC.modalPresentationStyle = .overFullScreen
        self.present(homeTabVC, animated: true)
    }
    

  

}
