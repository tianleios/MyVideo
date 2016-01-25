//
//  NSString+add.m
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "NSString+add.h"

@implementation NSString (add)


+ (UIColor *)stringHexConvertColor:(NSString *)hexColor;
{
    if (hexColor.length == 7 && [hexColor hasPrefix:@"#"]) {
        
        unsigned int red, green, blue;
        NSRange range;
        range.length = 2;
        
        range.location = 1;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
        
        range.location = 3;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
        
        range.location = 5;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
        
        return [UIColor colorWithRed:((float)red/255.0f) green:((float)green/255.0f) blue:((float)blue/255.0f) alpha:0.5f];
        
    }else{
        NSLog(@"该字符串，不是合法的 ，like “#ff2345” is right");
        return nil;
    }

    
}


+(CGSize)calculateStringSize:(CGSize)size string:(NSString *)string font:(CGFloat)fontSize
{
    CGSize stringSize;
    UIFont *font= [UIFont systemFontOfSize:fontSize];
    NSDictionary *dict = @{
                           NSFontAttributeName:font
                           };
    stringSize = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return stringSize;
}

@end
