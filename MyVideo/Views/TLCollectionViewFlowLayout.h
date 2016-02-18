//
//  TLCollectionViewFlowLayout.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

#import <UIKit/UIKit.h>

@protocol TLCollectionViewFlowLayoutDelegate <NSObject>

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface TLCollectionViewFlowLayout : UICollectionViewLayout

// default is 2.  this value less than 2 is nothing. when this value is 2 支持高度的矫正

@property (nonatomic, assign) NSInteger numOfFlow;

@property (nonatomic, weak) id <TLCollectionViewFlowLayoutDelegate> flowlayoutDelegate;

@end
