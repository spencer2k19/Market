//
//  RegisterViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 18/07/2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        initViews()
       
    }
    
    private func initViews() {
        usernameView.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        usernameView.layer.borderWidth = 1.0
        usernameView.layer.cornerRadius = 5.0
        
        
        emailView.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        emailView.layer.borderWidth = 1.0
        emailView.layer.cornerRadius = 5.0
        
        passwordView.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.cornerRadius = 5.0
    }
    

    @IBAction func onSignInClicked(_ sender: UIButton) {
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
