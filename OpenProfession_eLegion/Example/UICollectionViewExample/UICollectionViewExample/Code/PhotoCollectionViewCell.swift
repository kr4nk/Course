//
//  PhotoCollectionViewCell.swift
//  UICollectionViewExample
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var photoImageView: UIImageView!
    
    // MARK: - UICollectionViewCell
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.frame = bounds
    }
    
    // MARK: - Public
    
    func setPhoto(_ photo: Photo) {
        photoImageView.image = photo.image
    }
}
