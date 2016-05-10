//
//  DetailJobShareView.h
//  拉勾
//
//  Created by Steven on 16/5/9.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailJobShareView;
@protocol DetailJobShareViewDelegate <NSObject>
-(void)ShareViewCancelBtnClick:(UIButton *)button;
@end
@interface DetailJobShareView : UIView
@property(nonatomic,strong)UIView   *contentView;
@property(nonatomic,strong)UIButton *shareIconBtn;
@property(nonatomic,strong)UILabel  *shareLabel;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,weak)id <DetailJobShareViewDelegate> Delegate;
-(instancetype)initWithButtonArray:(NSArray *)buttonarray AndTitleArray:(NSArray *)titlearray;
-(void)show;
@end
