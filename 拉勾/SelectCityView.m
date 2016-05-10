//
//  SelectCityView.m
//  拉勾
//
//  Created by Steven on 16/4/24.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "SelectCityView.h"

#define  KscreenW    [UIScreen mainScreen].bounds.size.width

@implementation SelectCityView

-(instancetype)initWithTitleArray:(NSArray *)titleArray
{
    if (self = [super init]) {
        CGFloat CityBtnX;
        CGFloat CityBtnY;
        CGFloat CityBtnW = 90;
        CGFloat CityBtnH = 25;
        CGFloat MarginX = (KscreenW - 3*CityBtnW)/4.f;
        CGFloat MarginY = MarginX - 8;
        for (int k = 0; k < titleArray.count; k ++) {
            int m = k%3;
            CityBtnX = MarginX + m*(CityBtnW + MarginX);
            CityBtnY = MarginY + (k/3)*(CityBtnH + MarginY);
            _cityBtn = [[UIButton alloc]initWithFrame:CGRectMake(CityBtnX, CityBtnY, CityBtnW, CityBtnH)];
            _cityBtn.backgroundColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:192/255.f];
            [_cityBtn setTitle:titleArray[k] forState:UIControlStateNormal];
            [_cityBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [self addSubview:_cityBtn];
            _cityBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
            _cityBtn.layer.cornerRadius = 12;
            [_cityBtn addTarget:self action:@selector(dismissController:) forControlEvents:UIControlEventTouchUpInside];
            _selfFrame = CGRectMake(0, 0, KscreenW,MarginY + (ceil(k/3)+1)*(MarginY + CityBtnH));
    
        }
        
    }return self;
}


-(IBAction)dismissController:(UIButton *)sender
{
    [_cityDelegate DismisControllerWhenClickBtn:sender.titleLabel.text];
    
}


@end
