//
//  TLOwner.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

@interface TLOwner : TLBaseModel

//"suid":"trJQIeFVwNXOzOLo",
//"loginName":"paike_0tv8wz74pv",
//"nick":"凤凰时尚",
//"icon":"http://tp1.sinaimg.cn/2162418640/180/5602398369/0",
//"oldIcon":"http://tp1.sinaimg.cn/2162418640/180/5602398369/0",

//"v":true,
//"org_v":3,
//"top_num":0,
//"info":"凤凰网时尚频道秒拍官方号",
//"status":0,
//"gold":0,
//"talent_v":20,
//"talent_name":"媒体机构"

@property (nonatomic, copy) NSString *suid;
@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *oldIcon;

@property (nonatomic, strong) NSNumber *v;
@property (nonatomic, strong) NSNumber *org_v;
@property (nonatomic, strong) NSNumber *top_num;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSNumber *gold;
@property (nonatomic, strong) NSNumber *talent_v;

@property (nonatomic, copy) NSString *talent_name;









@end
