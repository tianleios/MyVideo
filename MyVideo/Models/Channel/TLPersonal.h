//
//  TLPersonal.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

#import "TLChannel.h"
@interface TLPersonal : TLBaseModel

//"type":"channel",
//"channel":Object{...}

@property (nonatomic, strong) TLChannel *channel;
@property (nonatomic, copy) NSString *type;


@end
