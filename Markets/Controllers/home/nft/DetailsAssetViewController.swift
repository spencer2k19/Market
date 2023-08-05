//
//  DetailsAssetViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 04/08/2023.
//

import UIKit

class DetailsAssetViewController: UIViewController {

    
    @IBOutlet weak var backContainer: UIView!
    
    @IBOutlet weak var imageHeaderView: UIImageView!
    
    @IBOutlet weak var favoriteContainer: UIView!

    @IBOutlet weak var priceHistoryContainer: UIView!
    
    @IBOutlet weak var priceContainer: UIView!
    
    @IBOutlet weak var chinContainer: UIView!
    
    @IBOutlet weak var bodyContainer: UIView!
    @IBOutlet weak var environmentContainer: UIView!
    
    
    @IBOutlet weak var costumeContainer: UIView!
    
    
    @IBOutlet weak var eyeContainer: UIView!
    
    
    @IBOutlet weak var eyeBrowContainer: UIView!
    
    
    @IBOutlet weak var middleGroundContainer: UIView!
    @IBOutlet weak var mouthContainer: UIView!
    
    @IBOutlet weak var buyButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    
   
    

    private func setupViews() {
        //header icons
        backContainer.layer.cornerRadius = backContainer.frame.width / 2
        favoriteContainer.layer.cornerRadius = favoriteContainer.frame.width / 2
        
        //price container
        priceContainer.layer.cornerRadius = 6
        
        //history
       setupContainerView(container: priceHistoryContainer)
        setupContainerView(container: environmentContainer)
        setupContainerView(container: bodyContainer)
        setupContainerView(container: chinContainer)
        setupContainerView(container: costumeContainer)
        setupContainerView(container: eyeContainer)
        setupContainerView(container: eyeBrowContainer)
        setupContainerView(container: middleGroundContainer)
        setupContainerView(container: mouthContainer)
        
        //click handlers
        let backGesture = UITapGestureRecognizer(target: self, action: #selector(onBackPressed(_:)))
        backContainer.addGestureRecognizer(backGesture)
        
        buyButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPurchaseVC(_:))))
        
    }
    
    
    @objc func showPurchaseVC(_ sender: UITapGestureRecognizer) {
        let confirmPurchaseVC = storyboard?.instantiateViewController(withIdentifier: "confirmPurchaseVC") as! ConfirmPurchaseViewController
        confirmPurchaseVC.modalPresentationStyle = .overFullScreen
        self.present(confirmPurchaseVC, animated: true)
    }
    
    @objc func onBackPressed(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
    
    private func setupContainerView(container: UIView) {
        container.layer.cornerRadius = 3
        container.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        container.layer.borderWidth = 1
    }

}



