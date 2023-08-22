//
//  LoginViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 18/07/2023.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    
    private var viewModel: LoginViewModel = LoginViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
  
    
    @IBOutlet weak var emailView: Input!
    @IBOutlet weak var passwordView: Input!
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var rightEmailIcon: UIImageView!
    @IBOutlet weak var rightPasswordIcon: UIImageView!
    
    
    
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
   
    
   
    
    @IBAction func login(_ sender: UIButton) {
        showHome()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
        emailField.addTarget(self, action: #selector(textFieldEmailDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldPasswordDidChange(_:)), for: .editingChanged)
        
        
        rightPasswordIcon.addTapGestureRecognizer {
            self.viewModel.toggleSecureTextEntry()
        }
        
        
       bindToViewModel()
    }
    
    private func initViews() {
        
        emailView.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        emailView.layer.borderWidth = 1.0
        emailView.layer.cornerRadius = 5.0
        
        passwordView.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.cornerRadius = 5.0
        
       
    }
    
    @objc func textFieldEmailDidChange(_ textField: UITextField) {
        if let content = textField.text {
            viewModel.emailValidation(value: content)
        }
    }
    
    @objc func textFieldPasswordDidChange(_ textField: UITextField) {
        if let password = textField.text {
            viewModel.passwordValidation(value: password)
        }
    }
    
    
    private func bindToViewModel() {
        subscriptions = [
            emailSubscription(),
            passwordSubscription(),
            secureTextEntrySubscription()
        
        ]
    }
    
    
    //email subscription
    private func emailSubscription() -> AnyCancellable {
        return viewModel.$errorMsgForEmail
            .receive(on: DispatchQueue.main)
            .sink {[weak self] errorMsg in
                DispatchQueue.main.async {
                    guard let self = self else {return}
                    
                    self.emailView.hasError = !errorMsg.isEmpty
                    self.rightEmailIcon.image = errorMsg.isEmpty ? UIImage() : UIImage(systemName: "info.circle")
                    self.errorEmailLabel.text = errorMsg.isEmpty ? "" : errorMsg
                    
                    
                }
            }
           
    }
    
    
    
    //secure text entry subscription
    private func secureTextEntrySubscription() -> AnyCancellable {
        return viewModel.$isSecuredTextEntry
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                DispatchQueue.main.async {
                    guard let self = self else {return}
                    self.passwordField.isSecureTextEntry = value
                    self.rightPasswordIcon.image = value ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
                }
            }
    }
    
    
    
    //password subscription
    private func passwordSubscription() -> AnyCancellable {
        return viewModel.$errorMsgForPassword
            .receive(on: DispatchQueue.main)
            .sink {[weak self] errorMsg in
                DispatchQueue.main.async {
                    guard let self = self else {return}
                    
                    self.passwordView.hasError = !errorMsg.isEmpty
                    self.errorPasswordLabel.text = errorMsg.isEmpty ? "" : errorMsg
                    
                }
            }
            
    }
    
    
    //show home
    private func showHome() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let homeTabVC = storyBoard.instantiateViewController(withIdentifier: "homeTabVC")
        homeTabVC.modalPresentationStyle = .overFullScreen
        self.present(homeTabVC, animated: true)
    }
    

  
    @IBAction func showForgotPassword(_ sender: UIButton) {
        print("forgot password is clicked")
        performSegue(withIdentifier: "goToForgotPassword", sender: self)
    }
    
}



