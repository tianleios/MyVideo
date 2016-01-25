//
//  TLStream.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

@interface TLStream : TLBaseModel

//"base":"http://gslb.miaopai.com/stream/dlgA1ccDSwsZwIY6ymTQSg__.mp4?vend=miaopai&",
//"ios":"mp4miaopai",
//"and":"mp4",
//"vend":"miaopai",
//"ver":"miaopai"

@property (nonatomic, copy) NSString *base;
@property (nonatomic, copy) NSString *ios;

@property (nonatomic, copy) NSString *and_t;
@property (nonatomic, copy) NSString *vend;
@property (nonatomic, copy) NSString *ver;

@end
