//
//  TLExt.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"
#import "TLOwner.h"

@interface TLExt : TLBaseModel

//"length":22,
//"lengthNice":"00:22",
//"location":"",
//"finishTime":1453117818422,
//"finishTimeNice":"5分钟前",
//"t":"#凤凰时尚直击2016秋冬米兰男装周# @陈学冬 亮相@GUCCI 大秀，他会不会在这一季秀场里为自己的新电影《幻城》挑选一件呢~",
//"ft":"#凤凰时尚直击2016秋冬米兰男装周#",
//"status":30,
//"w":480,
//"h":480,
//"owner":Object{...}

@property (nonatomic, strong) NSNumber *length;

@property (nonatomic, copy) NSString *lengthNice;
@property (nonatomic, copy) NSString *location;

@property (nonatomic, strong) NSNumber *finishTime;
@property (nonatomic, copy) NSString *finishTimeNice;

@property (nonatomic, copy) NSString *t;

@property (nonatomic, copy) NSString *ft;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSNumber *w;
@property (nonatomic, strong) NSNumber *h;
@property (nonatomic, strong) TLOwner *owner;


@end
