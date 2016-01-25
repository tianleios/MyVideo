//
//  TLAlbum.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"
@class TLTopic;

@interface TLAlbum : TLBaseModel

//"color":"#b250ff",
//"title":"性感girl邓紫棋",
//"img":"http://wsacdn1.miaopai.com/upload-pic/fbe36bce2ec01e4bac1e33ccfc2f5a27.jpg",
//"gif":"",
//"extend":true,
//"ad":false,
//"buttonText":"",
//"type":"topic",
//"topic":Object{...}

@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *title;


@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *gif;

@property (nonatomic, strong) NSNumber *extend;
@property (nonatomic, strong) NSNumber *ad;

@property (nonatomic, copy) NSString *buttonText;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) TLTopic *topic;


@end
