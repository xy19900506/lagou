//
//  SelectCityView.h
//  拉勾
//
//  Created by Steven on 16/4/24.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectCityDelegate <NSObject>

-(void)DismisControllerWhenClickBtn:(NSString *)titletext;

@end

@interface SelectCityView : UIView
@property(nonatomic,strong)UIButton *cityBtn;
@property(nonatomic)CGRect selfFrame;
@property(nonatomic,weak)id <SelectCityDelegate> cityDelegate;

-(instancetype)initWithTitleArray:(NSArray *)titleArray;

@end
