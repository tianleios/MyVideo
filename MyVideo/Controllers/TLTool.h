//
//  TLTool.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TLToolGetDataType) {
    
    TLToolGetDataTypeLoadMore = 0,
    TLToolGetDataTypeLoadRefresh = 1
};

typedef NS_ENUM(NSInteger, TLToolCategoryType) {
    
    TLToolCategoryTypeStar = 124 ,//明星
    TLToolCategoryTypeJoke = 128 ,//笑话
    TLToolCategoryTypeIdea = 160  //创意
};

@interface TLTool : NSObject

//单例
+ (instancetype)shareTool;

//下拉
- (void)refreshWithType:(TLToolCategoryType)toolCategoryType success:(void(^)(id responseObject))success failure:(void(^)(NSError *  error))failure;

//上拉
- (void)loadMoreWithType:(TLToolCategoryType)toolCategoryType success:(void(^)(id responseObject))success failure:(void(^)(NSError *  error))failure;

@end
