//
//  GalleryViewController.swift
//  UICollectionViewExample
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    struct Const {
        static let itemSpacing: CGFloat = 16.0
        static let albumHeaderIdentifier = "albumHeaderIdentifier"
        static let headerHeight: CGFloat = 32.0
        static let changeLayoutButtonOffset: CGFloat = 16.0
    }
    
    @IBOutlet weak var changeLayoutButton: UIButton!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    var albums: [Album] = []
    
    // MARK: - Actions
    
    @IBAction func changeLayoutButtonPressed(_ sender: UIButton) {
        let newLayout: UICollectionViewLayout
        
        if galleryCollectionView.collectionViewLayout is UICollectionViewFlowLayout {
            newLayout = SFFocusViewLayout()
        } else {
            newLayout = UICollectionViewFlowLayout()
        }
        
        galleryCollectionView.setCollectionViewLayout(newLayout, animated: true)
    }
    
    @objc func handleLongPressGesture(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = galleryCollectionView.indexPathForItem(at: gesture.location(in: galleryCollectionView)) else {
                break
            }
            galleryCollectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            if let view = gesture.view {
                galleryCollectionView.updateInteractiveMovementTargetPosition(gesture.location(in: view))
            }
        case .ended:
            galleryCollectionView.endInteractiveMovement()
        default:
            galleryCollectionView.cancelInteractiveMovement()
        }
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albums = AlbumProvider().albums()

        galleryCollectionView.register(cellType: PhotoCollectionViewCell.self)
        galleryCollectionView.register(viewType: AlbumHeaderCollectionReusableView.self,
                                       kind: UICollectionElementKindSectionHeader)
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        
        let longPressGesture = UILongPressGestureRecognizer(target: self,
                                                            action: #selector(handleLongPressGesture(gesture:)))
        galleryCollectionView.addGestureRecognizer(longPressGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        galleryCollectionView.frame = view.frame
        
        let changeLayoutButtonX = view.frame.width - changeLayoutButton.frame.width - Const.changeLayoutButtonOffset
        changeLayoutButton.frame.origin = CGPoint(x: changeLayoutButtonX,
                                                  y: 44.0)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return albums[section].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = galleryCollectionView.dequeueCell(of: PhotoCollectionViewCell.self,
                                                     for: indexPath)
        cell.setPhoto(albums[indexPath.section].photos[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = galleryCollectionView.dequeueSupplementaryView(of: AlbumHeaderCollectionReusableView.self, kind: kind, for: indexPath)
        
        view.setAlbum(albums[indexPath.section])
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        moveItemAt sourceIndexPath: IndexPath,
                        to destinationIndexPath: IndexPath) {
        
        let movedPhoto = albums[sourceIndexPath.section].photos.remove(at: sourceIndexPath.item)
        albums[destinationIndexPath.section].photos.insert(movedPhoto, at: destinationIndexPath.item)
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        galleryCollectionView.deselectItem(at: indexPath, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (UIScreen.main.bounds.width - 3 * Const.itemSpacing) / 2
        
        if indexPath.item % 3 == 0 {
            return CGSize(width: itemWidth * 2 + Const.itemSpacing, height: itemWidth)
        } else {
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Const.itemSpacing,
                            left: Const.itemSpacing,
                            bottom: Const.itemSpacing * 2,
                            right: Const.itemSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Const.itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Const.itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: Const.headerHeight)
    }
}
