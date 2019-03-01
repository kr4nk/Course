//
//  CollectionViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoProvider = PhotoProvider()
        photoProvider.photos().forEach{ photos.append($0) }
        
        photoCollectionView.register(UINib(nibName: String(describing: PhotoCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PhotoCollectionViewCell.self))
        
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        photoCollectionView.frame = view.frame
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCollectionViewCell.self), for: indexPath) as! PhotoCollectionViewCell
        
        cell.configure(with: photos[indexPath.row])
        
        return cell
    }
}
