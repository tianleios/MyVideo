//
//  TLCollectionViewFlowLayout.m
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLCollectionViewFlowLayout.h"

#define kItemWidth  (kScreenWidth_tl - 3*kMargin_tl)/2

@interface TLCollectionViewFlowLayout ()

@property (nonatomic, strong) NSMutableArray *sizes;
@property (nonatomic, strong) NSMutableArray *xs;
@property (nonatomic, strong) NSMutableArray *ys;



@end
@implementation TLCollectionViewFlowLayout
{
    //判断有无数据，如果没有数据直接返回
    BOOL _isReturn;
    CGFloat _width;
    
    BOOL _isRevise; //当两条瀑布高度出现恶化时进行高度修正
    NSInteger _reviseCount;
}

- (NSMutableArray *)xs
{
    if (_xs == nil) {
        _xs = [NSMutableArray array];
    }

    return _xs;
}

- (NSMutableArray *)ys
{
    if (_ys == nil) {
        
        _ys =  [NSMutableArray array];
        
    }
    return _ys;
}

- (NSMutableArray *)sizes
{
    if (_sizes == nil) {
        
        _sizes = [NSMutableArray array];
    }
    
    return _sizes;
}

-(void)prepareLayout
{
    [super prepareLayout];

    _width = (kScreenWidth_tl - 3*kMargin_tl)/2 + 2*kMargin_tl;
    self.xs = nil;
    self.ys = nil;
    self.sizes = nil;
    
    _isReturn = NO;
    _isRevise = NO;
    _reviseCount = 0;
    [self getFrames];
    
}

- (void)getFrames
{
    //先考虑一种情况
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    if (items == 0) {
        _isReturn = YES;
        return;
    }
    
    if ([self.flowlayoutDelegate respondsToSelector:@selector(sizeForItemAtIndexPath:)]) {
        
        [self.sizes removeAllObjects];
        
        for (int i = 0; i < items; i ++) {///////////////////
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            CGSize size = [self.flowlayoutDelegate sizeForItemAtIndexPath:indexPath];
            [self.sizes addObject:[NSValue valueWithCGSize:size]];
            
            //计算每个控件的frame
            CGFloat x = 0;
            CGFloat y = 0;
            
            if (i%2 == _isRevise == NO ? 0:1) {
                x = kMargin_tl;
            }else{
                x = _width;
            }
            
            [self.xs addObject:@(x)];

            if (_reviseCount) {//**********************************
                
                //y
                if (i < 2) {
                    y = 0;
                }else{
                    
                    y  =  _reviseCount == 2 ? ([_ys[i - 1] floatValue] + [_sizes[i - 1] CGSizeValue].height +kMargin_tl) : ([_ys[i - 3] floatValue] + [_sizes[i - 3] CGSizeValue].height +kMargin_tl);
                }
                
                _reviseCount -- ;
                
            }else{
    
                //y
                if (i < 2) {
                    y = 0;
                }else{
                    
                    y = [_ys[i - 2] floatValue] + [_sizes[i - 2] CGSizeValue].height +kMargin_tl;
                }
            }//******************************************************************
            
            [self.ys addObject:@(y)];

            if (_reviseCount == 0 && i > 1 && fabs([_ys[i] floatValue] - [_ys[i - 1] floatValue]) > 50) {
        
                //四中情况只有  两种情况会让瀑布越来越高 i 比 i - 1还要低
                if (([_ys[i] floatValue] - [_ys[i - 1] floatValue]) <  0) {
                    _reviseCount = 2;
                    _isRevise = !_isRevise;
                }
                
            }
            
        }////////////////////////////////////////
        
    }else{
           NSLog(@"没有实现相关代理");
    }
    
}

//计算大小
- (CGSize)collectionViewContentSize
{
    if (_isReturn) {
        return CGSizeZero;
    }
    //最后可能有两个cell 判断最大的Y值

    //做判断 考虑  1 2三种情况
    if (_ys.count < 3) {
        
        if (_ys.count == 1) {
            return CGSizeMake(kScreenWidth_tl, [_ys[0] floatValue] + [_sizes[0] floatValue]);
        }else{ //为2
            
            CGFloat height00 = [_ys[0] floatValue] + [_sizes[0] CGSizeValue].height;
            CGFloat height01 = [_ys[1] floatValue] + [_sizes[1] CGSizeValue].height;
            
            CGFloat height = height00 > height01 ? height00 :height01;
            return CGSizeMake(kScreenWidth_tl, height);
        
        }
        
    }else{
    
    CGFloat height00 = [[_ys lastObject] floatValue] + [[_sizes lastObject] CGSizeValue].height;

    CGFloat height01 = [_ys[_ys.count - 2] floatValue] + [_sizes[_sizes.count - 2] CGSizeValue].height;
    
    CGFloat height = height00 > height01 ? height00 :height01;

    return CGSizeMake(kScreenWidth_tl, height);
    }
}


//返回布局对象
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layouts = [NSMutableArray array];
    
    for (int i = 0; i < self.sizes.count; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *la = [self layoutAttributesForItemAtIndexPath:indexPath];
        [layouts addObject:la];
        
    }
    
    return layouts;

}

//返回每一个布局对象
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes
                                       layoutAttributesForCellWithIndexPath:indexPath];
    
    
    CGFloat x = [_xs[indexPath.row] floatValue];
    CGFloat y = [_ys[indexPath.row] floatValue];
    CGSize size = [self.sizes[indexPath.row] CGSizeValue];
    layoutAttributes.frame = CGRectMake( x, y, size.width, size.height);
    return layoutAttributes;
}
@end
