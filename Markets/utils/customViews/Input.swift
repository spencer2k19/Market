//
//  Input.swift
//  Markets
//
//  Created by Loic HACHEME on 13/08/2023.
//

import UIKit


class Input: UIView {
    
    var hasError: Bool = false {
        didSet {
            setupView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.layer.borderColor = self.hasError ? UIColor(hex: "#DC2626").cgColor : UIColor(hex: "#D9D9D9").cgColor
    }
}
