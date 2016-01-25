//
//  UIView+ACFrame.h
//  实验
//
//  Created by 田磊 on 15/12/3.
//  Copyright © 2015年 田磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ACFrame)

/**
 * 起点
 */

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

/**
 * 宽高
 */
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

/**
 * 缩放后的终点 ，适应AC适配方式，做了内部修改
 */
@property (nonatomic, assign) CGFloat xx;
@property (nonatomic, assign) CGFloat yy;
/**
 * 正常的中点x
 */
@property (nonatomic, assign) CGFloat x_x;
/**
 * 正常的中点y
 */
@property (nonatomic, assign) CGFloat y_y;
/**
 * 中点x
 */
@property (nonatomic, assign) CGFloat centerX;
/**
 * 中点y
 */
@property (nonatomic, assign) CGFloat centerY;


@end
