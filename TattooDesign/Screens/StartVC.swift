//
//  StartVC.swift
//  TattooDesign
//
//  Created by Паша Шарков on 15.11.2021.
//

import UIKit

class StartVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        overrideUserInterfaceStyle = .light
        setupMenuButton()
    }
    
    private func setupMenuButton() {
        var configuration = UIButton.Configuration.filled()
        let image = UIImage(named: "menu.pdf")
        configuration.image = image
        configuration.baseBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 20,
          leading: 20, bottom: 70, trailing: 20)
        menuButton.configuration = configuration
    }

    @IBAction func menuButtonTapped(_ sender: UIButton) {
    }
}
