//
//  SigenVC.swift
//  TattooDesign
//
//  Created by Паша Шарков on 13.11.2021.
//

import UIKit

class SignVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    var passwordIconClick = false
    var confirmIconClick = false
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var containerTFViews: [UIView]!
    @IBOutlet var allTextFields: [CustomTextField]!
    @IBOutlet weak var passwordEyeButton: UIButton!
    @IBOutlet weak var confirmEyeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        overrideUserInterfaceStyle = .light
        setupTF()
        setupEyeButton()
        setupGRecog()
        
        for view in containerTFViews {
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 25
        }
    }
    
    private func setupEyeButton() {
        var configuration = UIButton.Configuration.filled()
        let image = UIImage(named: "eyeIcon.pdf")
        image?.accessibilityFrame = CGRect(x: 0, y: 0, width: 22, height: 15)
        configuration.baseBackgroundColor = UIColor.white
        configuration.image = image
        confirmEyeButton.configuration = configuration
        passwordEyeButton.configuration = configuration
    }
    
    private func setupTF() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(sender:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil);
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(sender:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil);
    }
    
    private func setupGRecog() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if self.view.frame.origin.y >= 0 {
            guard let keyboardRect = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            self.view.frame.origin.y = -(keyboardRect.height - 140)
            
            let contentInsets = UIEdgeInsets(top: 50, left: 0, bottom: keyboardRect.height - 140, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        for field in allTextFields {
            field.resignFirstResponder()
        }
    }
    
    @IBAction func passwordEyeTapped(_ sender: UIButton) {
        if !passwordIconClick {
            allTextFields[2].isSecureTextEntry = false
        } else {
            allTextFields[2].isSecureTextEntry = true
        }
        passwordIconClick = !passwordIconClick
    }
    
    @IBAction func confirmEyeTapped(_ sender: UIButton) {
        if !confirmIconClick {
            allTextFields[3].isSecureTextEntry = false
        } else {
            allTextFields[3].isSecureTextEntry = true
        }
        confirmIconClick = !confirmIconClick
    }
    
    deinit {
        print("deinit - \(self)")
        NotificationCenter.default.removeObserver(self);
    }
}

