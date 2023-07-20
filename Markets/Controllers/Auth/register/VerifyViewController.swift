//
//  VerifyViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 20/07/2023.
//

import UIKit

class VerifyViewController: UIViewController {

    //email
    @IBOutlet weak var emailContainer: UIView!
    
    @IBOutlet weak var emailIconContainer: UIView!
    
    @IBOutlet weak var emailIcon: UIImageView!
    
    @IBOutlet weak var emailTitle: UILabel!
    
    @IBOutlet weak var emailSubtitle: UILabel!
    
    @IBOutlet weak var emailCheckView: UIView!
    @IBOutlet weak var emailCheckIcon: UIImageView!
    
    
    //phone

    @IBOutlet weak var phoneContainer: UIView!
    
    @IBOutlet weak var phoneIconContainer: UIView!
    
    
    @IBOutlet weak var phoneIcon: UIImageView!
    
    @IBOutlet weak var phoneTitle: UILabel!
    
    @IBOutlet weak var phoneSubtitle: UILabel!
    
    @IBOutlet weak var phoneCheckView: UIView!
    
    @IBOutlet weak var phoneCheckIcon: UIImageView!
    
    
    
    private var isEmailChecked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

      initView()
    }
    
    
   
    @IBAction func goToNextScreen(_ sender: UIButton) {
        performSegue(withIdentifier: "showVerificationPhone", sender: self)
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


extension VerifyViewController {
    
    private func initView() {
        handleVerificationType()
        let emailGesture = UITapGestureRecognizer(target: self, action: #selector(clickOnEmail(_:)))
        let phoneGesture = UITapGestureRecognizer(target: self, action: #selector(clickOnPhone(_:)))
        emailContainer.addGestureRecognizer(emailGesture)
        phoneContainer.addGestureRecognizer(phoneGesture)
        

    }
    
    @objc func clickOnEmail(_ sender: UITapGestureRecognizer) {
        isEmailChecked = true
        handleVerificationType()
    }
    
    @objc func clickOnPhone(_ sender: UITapGestureRecognizer) {
        isEmailChecked = false
        handleVerificationType()
    }
    
    
    
    private func handleVerificationType() {
        
        //email
        emailContainer.layer.borderWidth = 1.0
        emailContainer.layer.cornerRadius = 8.0
        
        emailIconContainer.layer.borderWidth = 1.0
        emailIconContainer.layer.cornerRadius = 8.0
        
        emailContainer.layer.borderColor = isEmailChecked ? UIColor(named: "AccentColor")?.cgColor : UIColor(hex: "#D9D9D9").cgColor
        
        emailContainer.backgroundColor = isEmailChecked ? UIColor(hex: "#DBEAFE") : UIColor.white
        
        
        //ICON Container
        emailIconContainer.layer.borderColor = isEmailChecked ? UIColor(named: "AccentColor")?.cgColor : UIColor(hex: "#D9D9D9").cgColor
        emailIconContainer.backgroundColor = isEmailChecked ? UIColor(named: "AccentColor") : UIColor(named: "#f3f4f6")
        
       
        
        
        
        emailIcon.tintColor = isEmailChecked ? UIColor.white : UIColor.black
        
        emailTitle.textColor = isEmailChecked ? UIColor(named: "AccentColor") : UIColor.black
        emailSubtitle.textColor = isEmailChecked ? UIColor(named: "AccentColor") : UIColor(hex: "#8C8C8C")
        
        
        
        emailCheckIcon.isHidden = !isEmailChecked
        emailCheckView.layer.borderWidth = 1.0
        emailCheckView.layer.borderColor = isEmailChecked ? UIColor(named: "AccentColor")?.cgColor : UIColor(hex: "#D9D9D9").cgColor
        
        
        emailCheckView.backgroundColor = isEmailChecked ? UIColor(hex: "#2563eb") : UIColor.white
        emailCheckView.layer.cornerRadius = emailCheckView.frame.width / 2
        emailCheckView.clipsToBounds = true
        
        
        
        //phone
        phoneContainer.layer.borderWidth = 1.0
        phoneContainer.layer.cornerRadius = 8.0
        phoneIconContainer.layer.borderWidth = 1.0
        phoneIconContainer.layer.cornerRadius = 8.0
        
        phoneContainer.layer.borderColor = !isEmailChecked ? UIColor(named: "AccentColor")?.cgColor : UIColor(hex: "#D9D9D9").cgColor
        
        phoneContainer.backgroundColor = !isEmailChecked ? UIColor(hex: "#DBEAFE") : UIColor.white
        
        //ICON Container
        phoneIconContainer.layer.borderColor = !isEmailChecked ? UIColor(named: "AccentColor")?.cgColor : UIColor(hex: "#D9D9D9").cgColor
        phoneIconContainer.backgroundColor = !isEmailChecked ? UIColor(named: "AccentColor") : UIColor(named: "#f3f4f6")
        
        
        phoneIcon.tintColor = !isEmailChecked ? UIColor.white : UIColor.black
        
        phoneTitle.textColor = !isEmailChecked ? UIColor(named: "AccentColor") : UIColor.black
        phoneSubtitle.textColor = !isEmailChecked ? UIColor(named: "AccentColor") : UIColor(hex: "#8C8C8C")
        
        
        
        phoneCheckIcon.isHidden = isEmailChecked
        phoneCheckView.layer.borderWidth = 1.0
        phoneCheckView.layer.borderColor = !isEmailChecked ? UIColor(named: "AccentColor")?.cgColor : UIColor(hex: "#D9D9D9").cgColor
        
        
        phoneCheckView.backgroundColor = !isEmailChecked ? UIColor(hex: "#2563eb") : UIColor.white
        phoneCheckView.layer.cornerRadius = phoneCheckView.frame.width / 2
        phoneCheckView.clipsToBounds = true
        
        
        
        
        
        
        
    }
}
