//
//  MessageTableViewCell.swift
//  UITableViewExample
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    struct Const {
        static let contentOffset: CGFloat = 16.0
    }
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var messageTextLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    // MARK: - UITableViewCell
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dateLabel.sizeToFit()
        
        avatarImageView.frame.origin = CGPoint(x: Const.contentOffset,
                                               y: Const.contentOffset)
        dateLabel.frame.origin = CGPoint(x: contentView.bounds.width - Const.contentOffset - dateLabel.frame.width,
                                                    y: Const.contentOffset)
        usernameLabel.frame = CGRect(x: avatarImageView.frame.maxX + Const.contentOffset,
                                     y: Const.contentOffset,
                                     width: dateLabel.frame.minX - Const.contentOffset * 3 - avatarImageView.frame.width,
                                     height: usernameLabel.frame.height)
        messageTextLabel.frame = CGRect(x: avatarImageView.frame.maxX + Const.contentOffset,
                                        y: dateLabel.frame.maxY + Const.contentOffset / 2,
                                        width: contentView.bounds.width - 3 * Const.contentOffset - avatarImageView.frame.width,
                                        height: contentView.bounds.height - 3 * Const.contentOffset - dateLabel.frame.height)
    }
    
    // MARK: - Public
    
    func setChat(_ chat: Message) {
        accessoryType = .disclosureIndicator
        
        avatarImageView.image = chat.avatar
        usernameLabel.text = chat.username
        messageTextLabel.text = chat.text
        dateLabel.text = chat.date
    }
}
