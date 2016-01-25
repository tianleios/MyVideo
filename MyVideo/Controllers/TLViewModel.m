//
//  TLViewModel.m
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLViewModel.h"
#import "NSString+add.h"



#define kTitleH 30
#define kIconH 40


@implementation TLViewModel
{

    CGFloat _width;

}

- (instancetype)init
{
    if (self = [super init]) {
        
        _width = (kScreenWidth_tl - 3*kMargin_tl)/2;
        
    }
    
    return self;
}
//个人

- (void)setAlbum:(TLAlbum *)album
{
    _album = album;
    _type = album.type;
    
    _imageF = CGRectMake(0, 0, _width, _width);
    _titleF01 = CGRectMake(0, CGRectGetHeight(_imageF) - 40, CGRectGetWidth(_imageF), 40);

    _unitHeight = _width;
    _size = CGSizeMake(_width, _width);
}

//专辑
- (void)setPersonal:(TLPersonal *)personal
{
    _personal = personal;
    _type = _personal.type;
    
    
    CGFloat _height = _width;
//    _width *[_personal.channel.ext.h floatValue]/[_personal.channel.ext.w floatValue];
    
    _imageF = CGRectMake(0, 0, _width, _height);
    
    //头像
    _iconF = CGRectMake(2*kMargin_tl,CGRectGetMaxY(_imageF) - kIconH*1.2/3, kIconH, kIconH);
    
    //名字
    _nameF = CGRectMake(CGRectGetMaxX(_iconF) + kMargin_tl, CGRectGetMaxY(_imageF), _width - CGRectGetMaxX(_iconF) - kMargin_tl, kIconH*1.3/3);
    
    //title
    CGFloat titleW =  _width - 2*CGRectGetMinX(_iconF) - 10;
       //计算高度
    CGSize size = CGSizeZero;
    if (_personal.channel.ext.ft.length) {
        
      size = [NSString calculateStringSize:CGSizeMake(titleW, MAXFLOAT) string:_personal.channel.ext.ft font:15];
    }
    
    _titleF02 = CGRectMake(CGRectGetMinX(_iconF) + 5, CGRectGetMaxY(_iconF) + kMargin_tl,titleW, size.height);
    
    _loverF = CGRectMake(0, CGRectGetMaxY(_titleF02), _width - kMargin_tl, 20);
    //总高度
    _unitHeight = CGRectGetMaxY(_loverF) + kMargin_tl/2;
    _size = CGSizeMake(_width , _unitHeight);
}
@end
