//
//  RefreshControl.m
//  拉勾
//
//  Created by Steven on 16/5/9.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "RefreshControl.h"

@implementation RefreshControl

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _IndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _IndicatorView.frame = CGRectMake(30, 5, 34, 34);
        [self addSubview:_IndicatorView];
        _IndicatorLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 8,260 , 28)];
        [self addSubview:_IndicatorLabel];
    }
    return self;
}

@end
