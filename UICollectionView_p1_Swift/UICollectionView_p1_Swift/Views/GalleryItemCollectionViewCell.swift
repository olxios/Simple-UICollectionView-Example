//
//  GalleryItemCollectionViewCell.swift
//  UICollectionView_p1_Swift
//
//  Created by olxios on 20/11/14.
//  Copyright (c) 2014 olxios. All rights reserved.
//

import UIKit

class GalleryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var itemImageView: UIImageView!
    
    func setGalleryItem(item:GalleryItem) {
        itemImageView.image = UIImage(named: item.itemImage)
    }
    
}