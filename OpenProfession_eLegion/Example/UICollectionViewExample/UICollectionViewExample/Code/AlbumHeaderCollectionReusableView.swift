//
//  AlbumHeaderCollectionReusableView.swift
//  UICollectionViewExample
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class AlbumHeaderCollectionReusableView: UICollectionReusableView {

    struct Const {
        static let titleLabelX: CGFloat = 16.0
    }
    
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - UICollectionReusableView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let titleLabelY = bounds.midY - titleLabel.frame.height / 2
        titleLabel.frame.origin = CGPoint(x: Const.titleLabelX, y: titleLabelY)
    }
    
    // MARK: - Public
    
    func setAlbum(_ album: Album) {
        titleLabel.text = album.name
        titleLabel.sizeToFit()
    }
}
