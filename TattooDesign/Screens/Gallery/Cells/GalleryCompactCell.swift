//
//  GalleryCompactCell.swift
//  TattooDesign
//
//  Created by Паша Шарков on 16.11.2021.
//

import UIKit

class GalleryCompactCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with: String) {
        imageView.image = UIImage(named: "\(with)")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
    }

}
