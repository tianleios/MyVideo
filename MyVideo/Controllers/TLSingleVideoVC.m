//
//  TLSingleVideoVC.m
//  MyVideo
//
//  Created by 田磊 on 16/1/21.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLSingleVideoVC.h"
#import "TLViewModel.h"
#import <MediaPlayer/MediaPlayer.h>
@interface TLSingleVideoVC ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView  *webV;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;
@property (nonatomic, strong) UIButton *backBut;

@end

@implementation TLSingleVideoVC
- (void)dealloc
{
    [_moviePlayerController stop];
    [_moviePlayerController.view removeFromSuperview];
    _moviePlayerController = nil;
    
}

///////////////////////////////////////////////
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 40, 40)];
    [backBut setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.view addSubview:backBut];
    [backBut addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    _backBut = backBut;
  
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];

}

-(MPMoviePlayerController *)moviePlayerController
{
    if (_moviePlayerController == nil) {
        
        NSURL *url = [NSURL URLWithString:_urlString];
       _moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:url];
        _moviePlayerController.shouldAutoplay = YES;
        _moviePlayerController.fullscreen = NO;
        
        _moviePlayerController.view.frame = CGRectMake(0, 20, kScreenWidth_tl, kScreenWidth_tl) ;
        [self.view addSubview:_moviePlayerController.view];


        [self.view addSubview:_backBut];
        
    }
    return _moviePlayerController;
}

- (void)setViewModel:(TLViewModel *)viewModel
{
    _viewModel = viewModel;
    
    
    self.urlString = _viewModel.personal.channel.stream.base;
    
    [self.moviePlayerController prepareToPlay];
    
    if (self.moviePlayerController.isPreparedToPlay) {
        [self.moviePlayerController play];
    }
    
    
//    [self.moviePlayerController  shouldAutoplay];
//    [self presentViewController:animated:YES completion:^{
//        
//    }];
//    NSURL *url = [NSURL URLWithString:_viewModel.personal.channel.stream.base];
//    
//    //    NSURL *url = [NSURL URLWithString:@"http://bbs.csdn.net/topics/391000065"];
//    NSMutableURLRequest *urlR = [[NSMutableURLRequest alloc] initWithURL:url];
//    [self.webV loadRequest:urlR];

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
