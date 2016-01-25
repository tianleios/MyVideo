//
//  TLExt02.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

@interface TLExt02 : TLBaseModel

//"length":22,
//"guid":"2016-01-18-12-31-21-359689.711670.mp4",
//"isPub":2,
//"createTime":1453117743114,
//"createTimeNice":"6分钟前",
//"vend":"miaopai"

@property (nonatomic, strong) NSNumber *length;

@property (nonatomic, copy) NSString *guid;
@property (nonatomic, strong) NSNumber *isPub;
@property (nonatomic, strong) NSNumber *createTime;

@property (nonatomic, copy) NSString *createTimeNice;
@property (nonatomic, copy) NSString *vend;



@end
