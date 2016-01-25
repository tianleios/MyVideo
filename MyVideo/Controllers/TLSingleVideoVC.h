//
//  TLSingleVideoVC.h
//  MyVideo
//
//  Created by 田磊 on 16/1/21.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLViewModel;
@interface TLSingleVideoVC : UIViewController

@property (nonatomic, strong) TLViewModel *viewModel;

@property (nonatomic, copy) NSString *urlString;

@end
