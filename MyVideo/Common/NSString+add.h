//
//  NSString+add.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (add)


+ (CGSize)calculateStringSize:(CGSize)size string:(NSString *)string font:(CGFloat)fontSize;

+ (UIColor *)stringHexConvertColor:(NSString *)hexString;

@end
