//
//  RefreshControl.h
//  拉勾
//
//  Created by Steven on 16/5/9.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger,RefreshState)
{
    RefreshStateNomal = 0,
    RefreshStatePulling = 1,
    RefreshStateUpdating = 2
    
};

typedef  NS_ENUM(NSInteger,RefreshType)
{
    RefreshTypeHeadView = 0,
    RefreshTypeFootView = 1
    
};

@class RefreshControl;
@protocol RefreshDelegate <NSObject>

//代理方法

@end

@interface RefreshControl : UIView
@property(nonatomic,strong)UILabel *IndicatorLabel;
@property(nonatomic,strong)UIActivityIndicatorView *IndicatorView;
@property(nonatomic,weak)id <RefreshDelegate> refreshDelegate;

-(void)RefreshScrollWhenTableViewDidScroll:(UIScrollView *)scroll;


@end
