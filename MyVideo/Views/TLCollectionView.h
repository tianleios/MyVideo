//
//  TLCollectionView.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class TLViewModel;
@interface TLCollectionView : UICollectionView


+ (instancetype)collectionViewWithFrame:(CGRect)frame;

@property (nonatomic, assign) TLToolCategoryType categoryType;

@property (nonatomic, copy) NSArray *units;

@end
