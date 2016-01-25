//
//  TLStat.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

@interface TLStat : TLBaseModel

//"vcnt":25635,
//"vcntNice":"2.5万",

//"ccnt":131,
//"scnt":0,
//"dcnt":0,
//"lcnt":20,
//"hcnt":0

@property (nonatomic, strong) NSNumber *vcnt;

@property (nonatomic, copy) NSString *vcntNice;

@property (nonatomic, strong) NSNumber *ccnt;
@property (nonatomic, strong) NSNumber *scnt;
@property (nonatomic, strong) NSNumber *dcnt;
@property (nonatomic, strong) NSNumber *lcnt;
@property (nonatomic, strong) NSNumber *hcnt;


@end
