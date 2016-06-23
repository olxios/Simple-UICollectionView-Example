//
//  GalleryItem.h
//  UICollectionView_p1_ObjC
//
//  Created by olxios on 19/11/14.
//  Copyright (c) 2014 olxios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalleryItem : NSObject

@property (nonatomic, strong) NSString *itemImage;

+ (instancetype)galleryItemWithDictionary:(NSDictionary *)dictionary;

@end
