//
//  TLViewModel.h
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TLAlbum.h" //专辑
#import "TLPersonal.h" //个人

@interface TLViewModel : UICollectionViewLayout


//公共
@property (nonatomic, assign) CGFloat unitHeight;

@property (nonatomic, assign) CGRect imageF;

@property (nonatomic, copy) NSString *type;

//1.专辑
@property (nonatomic, strong) TLAlbum *album;
@property (nonatomic, assign) CGRect titleF01;


//2.个人
@property (nonatomic, strong) TLPersonal *personal;

@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGRect nameF;
@property (nonatomic, assign) CGRect titleF02;
@property (nonatomic, assign) CGRect loverF;

@property (nonatomic, assign) CGSize size;


@end
