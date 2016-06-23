//
//  GalleryItemCollectionViewCell.m
//  UICollectionView_p1_ObjC
//
//  Created by olxios on 19/11/14.
//  Copyright (c) 2014 olxios. All rights reserved.
//

#import "GalleryItemCollectionViewCell.h"
#import "GalleryItem.h"

@implementation GalleryItemCollectionViewCell

- (void)setGalleryItem:(GalleryItem *)item
{
    _itemImageView.image = [UIImage imageNamed:item.itemImage];
}

@end
