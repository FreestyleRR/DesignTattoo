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
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        overrideUserInterfaceStyle = .light
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView
        setupMenuButton()
        setupViewAllButton()
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
    
    private func setupViewAllButton() {
        viewAllButton.backgroundColor = .white
        viewAllButton.layer.masksToBounds = true
        viewAllButton.layer.cornerRadius = 17
    }

    @IBAction func viewAllButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension GalleryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.inputViewController?.title
        return cell
    }
    
}
