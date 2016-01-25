//
//  TLTopic.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

@interface TLTopic : TLBaseModel
//"stpid":"mP0QQOwvE-I_",
//"topic":"#邓紫棋#",
//"pic":"",
//"desc":"we're渔民，we're伐木累",
//"type":true,
//"cover":""

@property (nonatomic, copy) NSString *stpid;
@property (nonatomic, copy) NSString *topic;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) NSNumber *type;

@property (nonatomic, copy) NSString *cover;




@end
