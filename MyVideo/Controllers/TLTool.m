//
//  TLTool.m
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLTool.h"

#import "TLAlbum.h"
#import "TLPersonal.h"

#import "TLViewModel.h"

#define kStarUrl  @"http://api.miaopai.com/m/cate2_channel?extend=1&os=ios&per=20&type=news&unique_id=6250bd05dd20043b0bc0cfc2c6a678ae576096332&version=6.2.6"

//static NSInteger _lastPage;
static NSInteger _currentPage;

@interface TLTool ()

@property (nonatomic, strong) NSMutableArray *datas;



@end

@implementation TLTool

+ (void)initialize
{
    if (self == [TLTool class]) {
        
//        _lastPage = 0;
        _currentPage = 1;
        
    }
}

+ (instancetype)shareTool
{
    static TLTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[TLTool alloc] init];
    });
    return tool;
}

- (NSMutableArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    
    return _datas;
    
}

//下拉刷新
- (void)refreshWithType:(TLToolCategoryType)toolCategoryType success:(void(^)(id responseObject))success failure:(void(^)(NSError *  error))failure
{
    NSInteger page = 1;
    [self getDataWithPage:&page category:toolCategoryType type:TLToolGetDataTypeLoadRefresh success: success ? success :nil failure:failure ? failure : nil];

}

//上拉加载更多
- (void)loadMoreWithType:(TLToolCategoryType)toolCategoryType success:(void(^)(id responseObject))success failure:(void(^)(NSError *  error))failure
{
    [self getDataWithPage:&_currentPage category:toolCategoryType type:TLToolGetDataTypeLoadMore success: success ? success :nil failure:failure ? failure : nil];
}

//网络请求最底层方法
- (void)getDataWithPage:(NSInteger *)page category:(TLToolCategoryType)categoryType type:(TLToolGetDataType)getDataType success:(void(^)(id responseObject))success failure:(void(^)(NSError * _Nonnull error))failure
{
//cateid=124&
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"page"] = [NSString stringWithFormat:@"%ld",*page];
    parameters[@"cateid"] = [NSString stringWithFormat:@"%ld",categoryType];
    [manager GET:kStarUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //数据解析耗时操作放在子线程
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSArray *result = responseObject[@"result"];
            
            //如果是下拉刷新就清空数据
            if (getDataType == TLToolGetDataTypeLoadRefresh) {
                self.datas = nil;
            }
            
            //改变方式 ，把ViewModel进行传输
            for (int i = 0; i < result.count; i++) {

                NSDictionary *dict = result[i];
                NSString *type = dict[@"type"];
                
                //直接转换为 ViewModel  数组 传输到控制器
                TLViewModel *viewModel = [[TLViewModel alloc] init];
                if ([type isEqualToString:@"topic"]) {
                    
                    TLAlbum *album = [TLAlbum objectWithKeyValues:dict];
                    viewModel.album = album;
                  
                    [self.datas addObject:viewModel];
                    
                }else if([type isEqualToString:@"channel"]){
                    
                    TLPersonal *personal = [TLPersonal objectWithKeyValues:dict];
                    viewModel.personal = personal;
                    [self.datas addObject:viewModel];
                    
                }
                
            }
         //解析玩回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (success) {
                    
                    if (getDataType == TLToolGetDataTypeLoadMore) {
                        (*page) ++;  //成功Page+ 1
                    }else{  //当前查询页变为1
                        _currentPage = 2;
                    }
                    success(self.datas);
                    
                }
                
            });
            
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            failure(error);
        }
        
    }];


}
@end
