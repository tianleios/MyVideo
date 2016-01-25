//
//  TLCollectionViewCell.m
//  MyVideo
//
//  Created by 田磊 on 16/1/18.
//  Copyright © 2016年 田磊. All rights reserved.
//

#import "TLCollectionViewCell.h"

@interface TLCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UIImageView *iconIv;
@property (nonatomic, strong) UILabel *nameLbl;

@property (nonatomic, strong) UILabel *titleLbl01; //专辑样式
@property (nonatomic, strong) UILabel *titleLbl02; //个人样式

@property (nonatomic, strong) CATextLayer *loverLayer;

@end

@implementation TLCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageV = [[UIImageView alloc] init];
        [self addSubview:_imageV];
        _imageV.backgroundColor = [UIColor redColor];

        
        _iconIv = [[UIImageView alloc] init];
        [self addSubview:_iconIv];
        
        _nameLbl = [[UILabel alloc] init];
        [self addSubview:_nameLbl];
        _nameLbl.textColor = [UIColor grayColor];
        _nameLbl.font = font(12);
        
        //专辑
        _titleLbl01 = [[UILabel alloc] init];
        [self addSubview:_titleLbl01];
        _titleLbl01.font = font(15);
        _titleLbl01.numberOfLines = 0;
        _titleLbl01.textAlignment = NSTextAlignmentCenter;
        _titleLbl01.textColor = [UIColor whiteColor];
        
        //个人
        _titleLbl02 = [[UILabel alloc] init];
        [self addSubview:_titleLbl02];
        _titleLbl02.font = font(15);
        _titleLbl02.numberOfLines = 0;
        _titleLbl02.textAlignment = NSTextAlignmentLeft;
        _titleLbl02.textColor = [UIColor blackColor];
        
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        
        //喜欢的人
        _loverLayer = [[CATextLayer alloc] init];
        [self.layer addSublayer: _loverLayer];

//        _loverLayer.foregroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"placeholder"]].CGColor;
//        _loverLayer.foregroundColor  = [UIColor colorWithRed:100 green:].CGColor;
        _loverLayer.foregroundColor = [UIColor purpleColor].CGColor;
        _loverLayer.fontSize = 15;
        _loverLayer.alignmentMode = kCAAlignmentRight;
        _loverLayer.contentsScale = [[UIScreen mainScreen] scale];
        //颜色
        _imageV.backgroundColor = [UIColor cyanColor];
 
    }
    return self;
}

- (void)setViewModel:(TLViewModel *)viewModel
{
    _viewModel = viewModel;
    
    //图片
    _imageV.frame = _viewModel.imageF;
    
    //合辑
    if ([_viewModel.type isEqualToString:@"topic"]) {
        
        _iconIv.hidden = YES;
        _nameLbl.hidden = YES;
        _loverLayer.hidden = YES;
        _titleLbl01.hidden = NO;
        
        NSURL *url = [NSURL URLWithString:_viewModel.album.img];
        [_imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        _titleLbl01.backgroundColor = [NSString stringHexConvertColor:_viewModel.album.color];
        _titleLbl01.frame = _viewModel.titleF01;
        _titleLbl01.text = _viewModel.album.title;
        
    }else{//个人   channel
    
        _iconIv.hidden = NO;
        _nameLbl.hidden = NO;
        _titleLbl01.hidden = YES;
        _loverLayer.hidden = NO;
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_viewModel.personal.channel.pic.base, _viewModel.personal.channel.pic.m]];
        
        [_imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder"]];
        _imageV.backgroundColor = [UIColor blueColor];
        //收藏人数
    
        //头像
        _iconIv.frame  = _viewModel.iconF;
        NSURL *urlIcon = [NSURL URLWithString:_viewModel.personal.channel.ext.owner.icon];
        [_iconIv sd_setImageWithURL:urlIcon placeholderImage:[UIImage imageNamed:@"placeholder"]];
        _iconIv.layer.masksToBounds = YES;
        _iconIv.layer.cornerRadius = _iconIv.width/2;
        _iconIv.layer.borderWidth = 2;
        _iconIv.layer.borderColor = [UIColor whiteColor].CGColor;
        
        //名字
        _nameLbl.frame = _viewModel.nameF;
        _nameLbl.text =_viewModel.personal.channel.ext.owner.nick;
        
        //title
        _titleLbl02.frame = _viewModel.titleF02;
        _titleLbl02.text = _viewModel.personal.channel.ext.ft;
      //收藏人数
        [UIView animateWithDuration:0.5 animations:^{
            
            _loverLayer.frame = _viewModel.loverF;
            
 
        }];
        _loverLayer.string = [NSString stringWithFormat:@"lover - %@",_viewModel.personal.channel.stat.vcnt];
    }
    
}

@end
