//
//  TLChannel.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

#import "TLStat.h"
#import "TLPic.h"
#import "TLExt.h"
#import "TLStream.h"
#import "TLExt02.h"
//#import "TLOwner.h"
@interface TLChannel : TLBaseModel

//"scid":"dlgA1ccDSwsZwIY6ymTQSg__",
//"type":16,
//"liveStatus":0,
//"stat":Object{...},
//"pic":Object{...},
//"stream":Object{...},
//"ext":Object{...},
//"ext2":Object{...},
//"topicinfo":A

@property (nonatomic, copy) NSString *scid;
@property (nonatomic, strong ) NSNumber *type;
@property (nonatomic, strong ) NSNumber *liveStatus;

@property (nonatomic, strong) TLStat *stat;
@property (nonatomic, strong) TLPic *pic;
@property (nonatomic, strong) TLStream *stream;
@property (nonatomic, strong) TLExt *ext;
@property (nonatomic, strong) TLExt02 *ext2;
//@property (nonatomic, strong) TLOwner *<#vcs#>;




@end
