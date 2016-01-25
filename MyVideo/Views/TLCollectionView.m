//
//  TLCollectionView.m
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLCollectionView.h"
#import "TLCollectionViewFlowLayout.h"
#import "TLCollectionViewCell.h"
#import "TLSingleVideoVC.h"
#import "TLViewModel.h"

@interface TLCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,TLCollectionViewFlowLayoutDelegate>

@end


@implementation TLCollectionView

static NSString *ID = @"StarCell";

+ (instancetype)collectionViewWithFrame:(CGRect)frame
{
  
    
    TLCollectionViewFlowLayout *fl = [[TLCollectionViewFlowLayout alloc] init];
    TLCollectionView *cv  = [[TLCollectionView alloc] initWithFrame:frame collectionViewLayout:fl];
    
    fl.flowlayoutDelegate = cv;
    
    cv.contentInset = UIEdgeInsetsMake(kMargin_tl, 0, kMargin_tl, 0);
    cv.dataSource = cv;
    cv.delegate = cv;
    
    [cv registerClass:[TLCollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    
    return cv;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
       
    }
    return self;

}
- (void)setUnits:(NSArray *)units
{
     _units = units;
     [self reloadData];
}



//自定义布局对象的代理方法
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TLViewModel *vm = _units[indexPath.row];
    return vm.size;
}

//collectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TLViewModel *vm = _units[indexPath.row];
    
    UIApplication *app = [UIApplication sharedApplication];
    UINavigationController *nav = (UINavigationController *)app.keyWindow.rootViewController;
    TLSingleVideoVC *vc = [[TLSingleVideoVC alloc] init];
    
    vc.viewModel = vm;
    
    [nav pushViewController:vc animated:YES];


}
//    dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _units.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.viewModel = _units[indexPath.row];
    return cell;
}

@end
