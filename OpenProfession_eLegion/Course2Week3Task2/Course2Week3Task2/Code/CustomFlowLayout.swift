//
//  CustomFlowLayout.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

fileprivate enum constants {
    static let margin              = CGFloat(16.0)
    static let firstCellHeight     = CGFloat(300.0)
    static let standardCellHeight  = CGFloat(200.0)
    static let cellWidth           = (UIScreen.main.bounds.width - 3 * 16) / 2
}

class CustomFlowLayout: UICollectionViewLayout {
    
    private var layoutAttributesCache: [UICollectionViewLayoutAttributes] = []
    private var collectionViewWidth: CGFloat                              = UIScreen.main.bounds.width - constants.margin * 2
    private var collectionViewHeight: CGFloat                             = 0
    private let numberOfColumns                                           = 2
    
    override func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        if layoutAttributesCache.isEmpty {
            
            let xOffset             = [constants.margin, constants.margin * 2 + constants.cellWidth]
            var yOffset             = [CGFloat](repeating: 0.0, count: numberOfColumns)
            var column              = 0
            var maximumColumn1Heght = CGFloat(0)
            var maximumColumn2Heght = CGFloat(0)
            
            for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
                let indexPath      = IndexPath(item: item, section: 0)
                let itemAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                
                let currentItemHeight = (item == 0) ? constants.firstCellHeight : constants.standardCellHeight
                
                itemAttributes.frame = CGRect(x: xOffset[column], y: yOffset[column] + constants.margin, width: constants.cellWidth, height: currentItemHeight)
                
                let currentYOffset = constants.margin + itemAttributes.frame.size.height
                
                yOffset[column] += currentYOffset
                
                if (column == 0)  {
                    maximumColumn1Heght += currentYOffset
                } else {
                    maximumColumn2Heght += currentYOffset
                }
                
                if (item == 1) {
                    column = 1
                } else {
                    column = (column - 1) < 0 ? 1 : 0
                }
                
                layoutAttributesCache.append(itemAttributes)
            }
            
            collectionViewHeight = max(maximumColumn1Heght, maximumColumn2Heght)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in layoutAttributesCache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
}
