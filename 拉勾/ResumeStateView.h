//
//  ResumeStateView.h
//  拉勾
//
//  Created by Steven on 16/4/22.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ResumeStateDelegate <NSObject>
-(void)ResumeStateViewDidScrollWhenScrollViewDidScroll:(CGFloat )page;
@end

@interface ResumeStateView : UIView
@property(nonatomic,strong)UIButton     *TitleButton;
@property(nonatomic,strong)UIView       *indicatorView;
@property(nonatomic,assign)CGFloat      ButtonW;
@property(nonatomic,assign)CGFloat      Margin;
@property(nonatomic,strong)NSArray      *TitleBtnArray;
@property(nonatomic,assign)NSInteger    index;

@property(nonatomic,weak) id <ResumeStateDelegate> resumeDelegate;

-(instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titlearray;
-(void)ResumeSetContentofSet:(CGFloat)page;
@end
