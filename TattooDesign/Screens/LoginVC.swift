//
//  ViewController.swift
//  TattooDesign
//
//  Created by Паша Шарков on 09.11.2021.
//

import UIKit

class LoginVC: UIViewController {
    
    var iconClick: Bool = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @IBOutlet weak var containerViewPasswordTF: UIView!
    @IBOutlet weak var containerViewLoginTF: UIView!
    @IBOutlet weak var loginTextField: CustomTextField!
    @IBOutlet weak var passwordTextFIeld: CustomTextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTF()
        setup()
        setupEyeButton()
    }
    
    
    private func setup() {
        overrideUserInterfaceStyle = .light
        containerViewLoginTF.layer.masksToBounds = true
        containerViewPasswordTF.layer.masksToBounds = true
        containerViewLoginTF.layer.cornerRadius = 25
        containerViewPasswordTF.layer.cornerRadius = 25
    }
    
    private func setupEyeButton() {
        var configuration = UIButton.Configuration.filled()
        let image = UIImage(named: "eyeIcon.pdf")
        image?.accessibilityFrame = CGRect(x: 0, y: 0, width: 22, height: 15)
        configuration.baseBackgroundColor = UIColor.white
        configuration.image = image
        eyeButton.configuration = configuration
    }
    
    private func setupTF() {
        setupGRecog()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(sender:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil);
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(sender:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil);
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if self.view.frame.origin.y >= 0 {
        guard let keyboardRect = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        self.view.frame.origin.y = -(keyboardRect.height - 30)
        
        let contentInsets = UIEdgeInsets(top: 50, left: 0, bottom: 40, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    private func setupGRecog() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        loginTextField.resignFirstResponder()
        passwordTextFIeld.resignFirstResponder()
    }
    
    @IBAction func eyeTapped(_ sender: Any) {
        if !iconClick {
            passwordTextFIeld.isSecureTextEntry = false
        } else {
            passwordTextFIeld.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    deinit {
        print("deinit - \(self)")
        NotificationCenter.default.removeObserver(self);
    }
}
