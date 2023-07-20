//
//  ResetPasswordViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 20/07/2023.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var confirmPasswordContainer: UIView!
    @IBOutlet weak var codeContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView(container: passwordContainer)
        initView(container: confirmPasswordContainer)
        initView(container: codeContainer)
    }
    
    
    private func initView(container: UIView) {
        container.layer.borderColor = UIColor(hex: "#D9D9D9").cgColor
        container.layer.borderWidth = 1.0
        container.layer.cornerRadius = 5.0
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
