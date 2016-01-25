//
//  ViewController.m
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "ViewController.h"

#import "TLTool.h"
#import "TLCollectionView.h"
#import "TLCollectionViewFlowLayout.h"
#import "YYFPSLabel.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *roomCollectionV;
@property (nonatomic, strong) UISegmentedControl *segmented;

@property (nonatomic, strong) NSMutableArray *refreshSate;
@property (nonatomic, strong) NSMutableArray *contentArray;


@property (nonatomic, strong) UIScrollView *scrollV;


@end

@implementation ViewController
{
    BOOL _isFirst;
}

- (NSMutableArray *)refreshSate
{
    if (_refreshSate == nil) {
        _refreshSate = [NSMutableArray array];
        for (int i = 0; i < 3; i ++) {
            _refreshSate[i] = @"0";
        }
        
    }
    
    return _refreshSate;
}

-(NSMutableArray *)contentArray
{
    if (_contentArray == nil) {
        _contentArray = [NSMutableArray array];
    }
    return _contentArray;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

    if ([self.refreshSate[0] isEqualToString:@"0"]) {
        
        TLCollectionView *tlcv = (TLCollectionView *)self.contentArray[0];
        [tlcv.mj_header beginRefreshing];
    }

}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //fps
    YYFPSLabel *_fpslable = [YYFPSLabel new];
    _fpslable.frame = CGRectMake(0,0, 60, 30);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_fpslable];
    _fpslable.backgroundColor = [UIColor whiteColor];
    //
    [self setUpFrame];
    
//    [self other];
}

- (void)other
{
//    _isFirst = YES;
//    //1.UI
//    _collectionV = [TLCollectionView collectionViewWithFrame:CGRectMake(0, 0, kScreenWidth_tl, kScreenHeight_tl)];
//    [self.view addSubview:_collectionV];
//    _collectionV.backgroundColor = [UIColor grayColor];
//    
//    //2.
//    TLTool *tool = [TLTool shareTool];
//    __weak typeof(self) weakSelf = self;
//    
//    _collectionV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        
//        [tool refreshSuccess:^(id responseObject) {
//            _isFirst = NO;
//            weakSelf.collectionV.units = responseObject;
//            [_collectionV.mj_header endRefreshing];
//            
//        } failure:^(NSError *error) {
//            
//        }];
//        
//    }];
//    
//    _collectionV.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        
//        [tool loadMoreSuccess:^(id responseObject) {
//            
//            weakSelf.collectionV.units = responseObject;
//            [_collectionV.mj_footer endRefreshing];
//            
//        } failure:^(NSError *error) {
//            
//            
//        }];
//        
//    }];
//

}

- (void)setUpFrame
{
    _segmented = [[UISegmentedControl alloc] initWithItems:@[@"~明星~",@"~搞笑~",@"~创意~"]];
    _segmented.selectedSegmentIndex = 0;
    self.navigationItem.titleView = _segmented;
    [_segmented addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventValueChanged];
    
    _scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth_tl, kScreenHeight_tl - 64)];
    _scrollV.contentSize = CGSizeMake(3*kScreenWidth_tl, kScreenHeight_tl - 64);
    _scrollV.pagingEnabled = YES;
//    _scrollV.alwaysBounceHorizontal = YES;
    _scrollV.backgroundColor = [UIColor orangeColor];
    _scrollV.delegate  =  self;
    [self.view addSubview:_scrollV];
    
    NSArray *typeArray = @[@(TLToolCategoryTypeStar),@(TLToolCategoryTypeJoke),@(TLToolCategoryTypeIdea)];
    for (int i = 0; i < 3 ; i ++) {
        
        TLCollectionView *cv = [TLCollectionView collectionViewWithFrame:CGRectMake(i*kScreenWidth_tl, 0, _scrollV.width, _scrollV.height)];
        cv.backgroundColor = [UIColor cyanColor];
        [_scrollV addSubview:cv];
        
        [self.contentArray addObject:cv];
        __weak typeof(self) weakSelf = self;
        __weak typeof(cv) weakCV = cv;
        TLTool *tool = [TLTool shareTool];
        cv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            
            [tool refreshWithType:[typeArray[i] integerValue] success:^(id responseObject) {
                
                weakCV.units = responseObject;
                [weakCV.mj_header endRefreshing];
                weakSelf.refreshSate[i] = @"1";
                
            } failure:^(NSError *error) {
                
            }];
            
        }];
        
        cv.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            [tool loadMoreWithType:[typeArray[i] integerValue] success:^(id responseObject) {
                
                weakCV.units = responseObject;
                [weakCV.mj_footer endRefreshing];
                
            } failure:^(NSError *error) {
                
            }];
            
        }];

    }
    
}

- (void)changeAction:(UISegmentedControl *)segmentedControl
{
    [_scrollV setContentOffset:CGPointMake(kScreenWidth_tl * segmentedControl.selectedSegmentIndex, 0) animated:YES];
}

#pragma -scrollView delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
        //计算偏移量
    NSInteger index = scrollView.contentOffset.x /kScreenWidth_tl;
    _segmented.selectedSegmentIndex = index;
    if ([self.refreshSate[index] isEqualToString:@"0"]) {
        
    TLCollectionView *tlcv = (TLCollectionView *)self.contentArray[index];
    [tlcv.mj_header beginRefreshing];
        
    }
}

#pragma -mark dataSource
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
