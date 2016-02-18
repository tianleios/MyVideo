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


@interface TLTool ()

@property (nonatomic, strong) NSMutableDictionary *dataDict;


@end

NSInteger _pageInfo[3] = {1};

@implementation TLTool

+ (void)initialize
{
    if (self == [TLTool class]) {
    
//        _lastPage = 0;
//        _currentPage = 1;
        
    }
}
static TLTool *_tool = nil;

//严格创建单例 保证只分配一份内存空间
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tool = [super allocWithZone:zone];
    });
    return _tool;

}

+ (instancetype)shareTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tool = [[TLTool alloc] init];
        //初始化分页信息
//        tool.page = [[TLPage alloc] init];
        _tool.dataDict = [NSMutableDictionary dictionary];
        
        _tool.dataDict[[NSString stringWithFormat:@"%ld",TLToolCategoryTypeIdea]] =[NSMutableArray array];
        _tool.dataDict[[NSString stringWithFormat:@"%ld",TLToolCategoryTypeStar]] =[NSMutableArray array];
        _tool.dataDict[[NSString stringWithFormat:@"%ld",TLToolCategoryTypeJoke]] =[NSMutableArray array];
        
    });
    return _tool;
}

//下拉刷新
- (void)refreshWithType:(TLToolCategoryType)toolCategoryType success:(void(^)(id responseObject))success failure:(void(^)(NSError *  error))failure
{
    [self getDataWithPage:(_pageInfo +[self getPageBy:toolCategoryType]) category:toolCategoryType type:TLToolGetDataTypeLoadRefresh success: success ? success :nil failure:failure ? failure : nil];

}

//上拉加载更多
- (void)loadMoreWithType:(TLToolCategoryType)toolCategoryType success:(void(^)(id responseObject))success failure:(void(^)(NSError *  error))failure
{
    [self getDataWithPage:(_pageInfo +[self getPageBy:toolCategoryType]) category:toolCategoryType type:TLToolGetDataTypeLoadMore success: success ? success :nil failure:failure ? failure : nil];
}

//网络请求最底层方法
- (void)getDataWithPage:(NSInteger *)typePage category:(TLToolCategoryType)categoryType type:(TLToolGetDataType)getDataType success:(void(^)(id responseObject))success failure:(void(^)(NSError * _Nonnull error))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"page"] = getDataType == TLToolGetDataTypeLoadRefresh ? @"1" :[NSString stringWithFormat:@"%ld",*typePage];
    parameters[@"cateid"] = [NSString stringWithFormat:@"%ld",categoryType];
    
    [manager GET:kStarUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //数据解析耗时操作放在子线程
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSArray *result = responseObject[@"result"];
            
            NSMutableArray *dataArray = self.dataDict[[NSString stringWithFormat:@"%ld",categoryType]];
            
            if (getDataType == TLToolGetDataTypeLoadRefresh) {
                
                [dataArray removeAllObjects];
                
            }
            //数据临时保存
            
            //改变方式 ，把ViewModel进行传输
            for (int i = 0; i < result.count; i++) {

                NSDictionary *dict = result[i];
                NSString *type = dict[@"type"];
                
                //直接转换为 ViewModel  数组 传输到控制器
                TLViewModel *viewModel = [[TLViewModel alloc] init];
                if ([type isEqualToString:@"topic"]) {
                    
                    TLAlbum *album = [TLAlbum objectWithKeyValues:dict];
                    viewModel.album = album;
                  
                    [dataArray addObject:viewModel];

                }else if([type isEqualToString:@"channel"]){
                    
                    TLPersonal *personal = [TLPersonal objectWithKeyValues:dict];
                    viewModel.personal = personal;
                    [dataArray addObject:viewModel];
                    
                }
                
            }
         //解析玩回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (success) {
                    
                    if (getDataType == TLToolGetDataTypeLoadMore) {

                        *typePage = *typePage +1;
                    }else{  //当前查询页变为1

                        *typePage = 2;

                    }
                    success(dataArray);
                    
                }
                
            });
            
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            
            failure(error);
        }
        
    }];

}

- (NSInteger)getPageBy:(TLToolCategoryType)categoryType
{
    switch (categoryType) {
        case 124 : return 0; break;
        case 128 : return 1; break;
            
        default: return 2; break;
            
    }
}
@end
