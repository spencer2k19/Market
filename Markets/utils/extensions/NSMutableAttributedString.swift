//
//  NSMutableAttributedString.swift
//  Markets
//
//  Created by Loic HACHEME on 28/07/2023.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
        func setColorForText(textToFind: String, withColor color: UIColor) {
         let range: NSRange? = self.mutableString.range(of: textToFind, options: .caseInsensitive)
          if range != nil {
              self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range!)
              self.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .medium), range: range!)
          }
        }
    
        
    func setFontForText(textToFind: String, withFont font: UIFont) {
     let range: NSRange? = self.mutableString.range(of: textToFind, options: .caseInsensitive)
      if range != nil {
          self.addAttribute(NSAttributedString.Key.font, value: font, range: range!)
      }
    }

}
