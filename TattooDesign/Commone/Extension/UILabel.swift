//
//  UILabel.swift
//  TattooDesign
//
//  Created by Паша Шарков on 15.11.2021.
//

import UIKit

extension UILabel {
    @IBInspectable
    var rotation: Int {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
}
