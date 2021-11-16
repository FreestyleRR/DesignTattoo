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
    
    let arrayNamesPhotos = ["photo1", "photo2", "photo1", "photo2",
                            "photo1", "photo2", "photo1", "photo2",]
    private let itemsPerRow: CGFloat = 4
    private let sectionInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)

    @IBOutlet weak var photoView: UIImageView!
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
        self.collectionView.register(UINib(nibName: "GalleryCompactCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
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
    
    func photo(for index: Int) -> String {
        return "\(arrayNamesPhotos[index]).pdf"
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
        arrayNamesPhotos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GalleryCompactCell else { return UICollectionViewCell() }
//        cell.backgroundColor = .blue
        cell.configure(with: photo(for: indexPath.row))
//        let photo = "\(arrayNamesPhotos[indexPath.row]).pdf"
//        cell.imageView.image = photo(for: indexPath.row)
//        cell.imageView.image = UIImage(named: photo)
        return cell
    }
    
}
//
//extension GalleryVC: UICollectionViewDelegateFlowLayout {
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//    sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//    let availableWidth = view.frame.width - paddingSpace
//    let widthPerItem = availableWidth / itemsPerRow
//    
//      return CGSize(width: widthPerItem, height: CGFloat(115.0))
//  }
//  
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//    insetForSectionAt section: Int) -> UIEdgeInsets {
//    return sectionInsets
//  }
//  
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return sectionInsets.left
//  }
//}
