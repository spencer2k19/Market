//
//  SlideViewController.swift
//  Markets
//
//  Created by Loic HACHEME on 27/07/2023.
//

import UIKit

class SlideViewController: PagerPageViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        image.image = UIImage(named: slide.imageName)
        titleLabel.text = slide.title
        contentLabel.text = slide.subtitle
    }
    

}
