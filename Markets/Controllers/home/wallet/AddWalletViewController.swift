//
//  AddWalletViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 28/07/2023.
//

import UIKit

class AddWalletViewController: UIViewController {
    
    @IBOutlet weak var connectContainer: UIView!
    @IBOutlet weak var trackContainer: UIView!
    @IBOutlet weak var importContainer: UIView!
    
    @IBOutlet weak var headerTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView(container: connectContainer)
        initView(container: trackContainer)
        initView(container: importContainer)
        
        let content: NSMutableAttributedString = NSMutableAttributedString(string: headerTitle.text ?? "")
        
        //font
        let color = UIColor(named: "AccentColor") ?? UIColor.blue
        content.setColorForText(textToFind: "Term of Service", withColor: color)
        content.setColorForText(textToFind: "Privacy policy", withColor: color)
        
        //color
        let font = UIFont.systemFont(ofSize: 14, weight: .medium)
        content.setFontForText(textToFind: "Term of Service", withFont: font)
        content.setFontForText(textToFind: "Privacy policy", withFont: font)
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        content.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, content.length))
    
        headerTitle.attributedText = content
        
        
        
        //gesture
        let gestureTitle = UITapGestureRecognizer(target: self, action: #selector(tappedOnHeaderTitle(_:)))
        headerTitle.isUserInteractionEnabled = true
        headerTitle.addGestureRecognizer(gestureTitle)
    }
    
    
    private func initView(container: UIView) {
       
        container.layer.borderColor = UIColor(hex: "#E6E6E6").cgColor
        container.layer.borderWidth = 1.0
        container.layer.cornerRadius = 3.0
       
    }
    
    
    @objc func tappedOnHeaderTitle(_ gesture: UITapGestureRecognizer) {
        guard let titleContent = self.headerTitle.text else {return}
        let privacyPolicyRange = (titleContent as NSString).range(of: "Privacy Policy")
        let termsOfServiceRange = (titleContent as NSString).range(of: "Term of Service")
        
        if gesture.didTapAttributedTextInLabel(label: headerTitle, inRange: privacyPolicyRange) {
            performSegue(withIdentifier: "goToPrivacy", sender: self)
        } else if gesture.didTapAttributedTextInLabel(label: headerTitle, inRange: termsOfServiceRange) {
            performSegue(withIdentifier: "goToTermService", sender: self)
        }
                
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
