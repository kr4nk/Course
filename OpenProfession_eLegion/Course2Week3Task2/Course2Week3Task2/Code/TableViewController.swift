//
//  TableViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var photoTableView: UITableView!
    var cells: [Photo] = []
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoProvider = PhotoProvider()
        photoProvider.photos().forEach{ cells.append($0) }
        
        photoTableView.register(UINib(nibName: String(describing: PhotoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PhotoTableViewCell.self))

        photoTableView.delegate = self
        photoTableView.dataSource = self
    }
    
     override func viewDidLayoutSubviews() {
        photoTableView.frame = view.frame
    }
    
     // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photoCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotoTableViewCell.self)) as! PhotoTableViewCell

        photoCell.setPhoto(pic: cells[indexPath.row].image, description: cells[indexPath.row].name)
        
        return photoCell
    }

    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         print("Row \(indexPath.row) selected")
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory at row \(indexPath.row) selected")
    }

}
