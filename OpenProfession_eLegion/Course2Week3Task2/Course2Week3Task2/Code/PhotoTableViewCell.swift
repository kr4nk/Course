//
//  PhotoTableViewCell.swift
//  Course2Week3Task2
//
//  Created by Evgeny Kirichenko on 22/02/2019.
//  Copyright © 2019 e-Legion. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet private weak var picImageView: UIImageView!
    @IBOutlet private weak var picNameLabel: UILabel!
    
    // MARK: - UITableViewCell
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    // MARK: - Public
    
    func setPhoto(pic image: UIImage, description name: String) {
        accessoryType = .detailButton
        
        picImageView.image = image
        picNameLabel.text = name
    }
}


