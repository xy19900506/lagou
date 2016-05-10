//
//  MessageTableViewCell.m
//  拉勾
//
//  Created by Steven on 16/4/21.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

-(instancetype)initWithImage:(NSString *)image WithName:(NSString *)name WithDetail:(NSString *)detaiel
{
    if (self = [super init]) {
        _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(8, 5, 40, 40)];
        [self addSubview:_imageview];
        _imageview.image = [UIImage imageNamed:image];
        //_imageview.backgroundColor = [UIColor redColor];
        _NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(51, 5, [UIScreen mainScreen].bounds.size.width-131, 25)];
        [self addSubview:_NameLabel];
        _NameLabel.text = name;
        _NameLabel.font = [UIFont systemFontOfSize:15.f];
        //_NameLabel.backgroundColor = [UIColor greenColor];
        _detaielLabel = [[UILabel alloc]initWithFrame:CGRectMake(51, 33, [UIScreen mainScreen].bounds.size.width-131, 12)];
        [self addSubview:_detaielLabel];
        _detaielLabel.text = detaiel;
        _detaielLabel.textColor = [UIColor lightGrayColor];
        _detaielLabel.font = [UIFont systemFontOfSize:11];
        //_detaielLabel.backgroundColor = [UIColor blueColor];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}
@end
