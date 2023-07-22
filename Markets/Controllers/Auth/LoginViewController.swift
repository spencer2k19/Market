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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
