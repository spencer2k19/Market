//
//  UIView.swift
//  Markets
//
//  Created by Loic HACHEME on 25/07/2023.
//

import Foundation
import UIKit

extension UIView {
    func addConstraintsWithFormatString(formate: String, views: UIView...) {
        var viewsDictionnary = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionnary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: formate, metrics: nil, views: viewsDictionnary))
    }
}
