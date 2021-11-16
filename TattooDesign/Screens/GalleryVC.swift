//
//  GalleryVC.swift
//  TattooDesign
//
//  Created by Паша Шарков on 15.11.2021.
//

import UIKit

class GalleryVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    
    private func setup() {
        overrideUserInterfaceStyle = .light
        setupMenuButton()
        print("sdf")
    }
    
    private func setupMenuButton() {
        var configuration = UIButton.Configuration.filled()
        let image = UIImage(named: "menu.pdf")
        configuration.image = image
        configuration.baseBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 20,
          leading: 20, bottom: 70, trailing: 20)
        backButton.configuration = configuration
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
