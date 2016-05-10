//
//  MetableViewCells.m
//  拉勾
//
//  Created by Steven on 16/4/24.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "MetableViewCells.h"

@implementation MetableViewCells
-(instancetype)initWithImage:(UIImage *)image info:(NSString *)information Detail:(NSString *)detail
{
    if (self =[super init]) {
        _IconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 11, 20, 20)];
        _IconImageView.image = image;
        [self addSubview:_IconImageView];
        
        _InfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(42, 12, 300, 20)];
        _InfoLabel.text = information;
        [self addSubview:_InfoLabel];
        
        _Detail = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-50, 10, 50, 22)];
        _Detail.text = detail;
        _Detail.font = [UIFont systemFontOfSize:12.f];
        _Detail.textColor = [UIColor lightGrayColor];
        [self addSubview:_Detail];
    }
    return self;
}
@end
