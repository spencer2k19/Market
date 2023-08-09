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
        
//        HStack(alignment: .center, spacing: 0) { ... }
//        .padding(.horizontal, 122)
//        .padding(.vertical, 16)
//        .frame(width: 327, alignment: .center)
//        .background(Color(red: 0.95, green: 0.96, blue: 0.96))
//        .cornerRadius(3)
//        .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 8)
        
        logoutBtn.layer.shadowColor = UIColor.black.withAlphaComponent(0.04).cgColor
        logoutBtn.layer.cornerRadius = 6
        logoutBtn.layer.shadowOffset = CGSize(width: 0, height: 10)

    }

}
