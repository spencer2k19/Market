//
//  RectanglePageControl.swift
//  Markets
//
//  Created by Loic HACHEME on 22/07/2023.
//

import Foundation
import UIKit

class RectanglePageControl: UIPageControl {
    private let activeColor: UIColor
    private let inactiveColor: UIColor
    
    
    init(activeColor: UIColor, inactiveColor: UIColor) {
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
           self.activeColor = .blue // Set default active color if needed
           self.inactiveColor = .lightGray // Set default inactive color if needed
           super.init(coder: aDecoder)
       }
    
    
  
    
    override func draw(_ rect: CGRect) {
        super.subviews.forEach { $0.removeFromSuperview() }

               let indicatorWidth: CGFloat = 10
               let indicatorHeight: CGFloat = 6
               let indicatorSpacing: CGFloat = 10

               let totalWidth = CGFloat(numberOfPages) * indicatorWidth + CGFloat(max(0, numberOfPages - 1)) * indicatorSpacing
               var x = (rect.width - totalWidth) / 2

               for i in 0..<numberOfPages {
                   let indicatorFrame = CGRect(x: x, y: (rect.height - indicatorHeight) / 2, width: indicatorWidth, height: indicatorHeight)
                   let indicator = UIView(frame: indicatorFrame)

                   indicator.backgroundColor = (i == currentPage) ? activeColor : inactiveColor
                   indicator.layer.cornerRadius = indicatorHeight / 2
                   self.addSubview(indicator)

                   x += indicatorWidth + indicatorSpacing
               }
    }
}
