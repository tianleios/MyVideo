//
//  TLPic.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLBaseModel.h"

@interface TLPic : TLBaseModel

//"base":"http://wsqncdn.miaopai.com/stream/dlgA1ccDSwsZwIY6ymTQSg__",
//"m":"_m.jpg",
//"s":"_s.jpg"

@property (nonatomic, copy) NSString *base;
@property (nonatomic, copy) NSString *m;
@property (nonatomic, copy) NSString *s;


@end
