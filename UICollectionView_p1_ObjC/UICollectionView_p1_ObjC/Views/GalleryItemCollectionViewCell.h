//
//  GalleryItemCollectionViewCell.h
//  UICollectionView_p1_ObjC
//
//  Created by olxios on 19/11/14.
//  Copyright (c) 2014 olxios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GalleryItem;

@interface GalleryItemCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *itemImageView;

- (void)setGalleryItem:(GalleryItem *)item;

@end
