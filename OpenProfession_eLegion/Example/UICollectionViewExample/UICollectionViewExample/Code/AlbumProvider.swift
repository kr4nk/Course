//
//  AlbumProvider.swift
//  UICollectionViewExample
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class AlbumProvider {
    func albums() -> [Album] {
        var albums: [Album] = []
        for (album, file) in [("Nature", "nature"), ("Cat", "cat"), ("Architecture", "architecture")] {
            
            var album = Album(name: album, photos: [])
            for i in (1...6) {
                let photo = Photo(name: "\(album) \(i)",
                    image: UIImage(named: "\(file)\(i).jpg")!)
                album.photos.append(photo)
            }
            
            albums.append(album)
        }
        
        return albums
    }
}
