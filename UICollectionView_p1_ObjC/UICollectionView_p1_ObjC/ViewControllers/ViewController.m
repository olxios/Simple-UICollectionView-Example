//
//  ViewController.m
//  UICollectionView_p1_ObjC
//
//  Created by olxios on 19/11/14.
//  Copyright (c) 2014 olxios. All rights reserved.
//

#import "ViewController.h"
#import "GalleryItem.h"
#import "GalleryItemCollectionViewCell.h"
#import "GalleryItemCommentView.h"

@interface ViewController ()
{
    NSArray *_galleryItems;
}

@end

@implementation ViewController

#pragma mark -
#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initGalleryItems];

    [_collectionView reloadData];
}

- (void)initGalleryItems
{
    NSMutableArray *items = [NSMutableArray array];
    
    NSString *inputFile = [[NSBundle mainBundle] pathForResource:@"items" ofType:@"plist"];
    NSArray *inputDataArray = [NSArray arrayWithContentsOfFile:inputFile];
    
    for (NSDictionary *inputItem in inputDataArray)
    {
        [items addObject:[GalleryItem galleryItemWithDictionary:inputItem]];
    }
    
    _galleryItems = items;
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_galleryItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GalleryItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GalleryItemCollectionViewCell" forIndexPath:indexPath];
    [cell setGalleryItem:_galleryItems[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    GalleryItemCommentView *commentView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"GalleryItemCommentView" forIndexPath:indexPath];
    
    commentView.commentLabel.text = [NSString stringWithFormat:@"Supplementary view of kind %@", kind];
    return commentView;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle: @"didSelectItemAtIndexPath:"
                                                                        message: [NSString stringWithFormat: @"Indexpath = %@", indexPath]
                                                                 preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle: @"Dismiss"
                                                          style: UIAlertActionStyleDestructive
                                                        handler: nil];
    
    [controller addAction: alertAction];
    
    [self presentViewController: controller animated: YES completion: nil];
}

#pragma mark -
#pragma mark - UICollectionViewFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat picDimension = self.view.frame.size.width / 4.0f;
    return CGSizeMake(picDimension, picDimension);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat leftRightInset = self.view.frame.size.width / 14.0f;
    return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset);
}


@end
