//
//  UIView+ACFrame.m
//  实验
//
//  Created by 田磊 on 15/12/3.
//  Copyright © 2015年 田磊. All rights reserved.
//

#import "UIView+ACFrame.h"

//#define scaleX (AppDelegate *)[UIApplication sharedApplication].delegate.autoSizeScaleX
//#define scaleY (AppDelegate *)[UIApplication sharedApplication].delegate.autoSizeScaleY
//
@implementation UIView (ACFrame)

//AppDelegate *appd = (AppDelegate *)[UIApplication sharedApplication].delegate;
//
//CGFloat scaleY = appd.autoSizeScaleY;
//CGFloat scaleX = appd.autoSizeScaleX;
//起点X
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.frame.origin.x;

}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y
{
    return self.frame.origin.y;
    
}
//宽高

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height
{
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;

}
-(CGFloat)height
{
    return self.frame.size.height;
}

//终点 AC专用

-(void)setXx:(CGFloat)xx
{
    return;
}

-(CGFloat)xx
{
    return (self.x + self.width);
    
}

-(void)setYy:(CGFloat)yy
{
    return;
    
}
-(CGFloat)yy
{
    return (self.y + self.height);
}


- (void)setX_x:(CGFloat)x_x
{
 return;
}

-(CGFloat)x_x
{
    return (self.x + self.width);
    
}


- (void)setY_y:(CGFloat)y_y
{
    return;

}


- (CGFloat)y_y
{
    
return (self.y + self.height);
    
}

-(void)setCenterX:(CGFloat)centerX
{
    CGFloat cX1 = self.x + self.width/2;
    
    self.x = centerX - cX1;
}

-(CGFloat)centerX
{
    return self.x + self.width/2;

}

-(void)setCenterY:(CGFloat)centerY
{
    CGFloat cY1 = self.y + self.height/2;
    
    self.y = centerY - cY1;
}

-(CGFloat)centerY
{
    return self.y + self.height/2;
    
}
@end
