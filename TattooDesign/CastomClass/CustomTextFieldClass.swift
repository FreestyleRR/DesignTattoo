//
//  CustomTextFieldClass.swift
//  TattooDesign
//
//  Created by Паша Шарков on 12.11.2021.
//

import UIKit

class CustomTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)))
    }
}
