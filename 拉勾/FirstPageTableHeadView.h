//
//  FirstPageTableHeadView.h
//  拉勾
//
//  Created by Steven on 16/4/27.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstPageTableHeadView : UIView
@property(nonatomic,strong)UIButton *HeadViewBtn;

-(instancetype)initWithFrame:(CGRect)frame Titlearray:(NSArray *)titlearray;
@end
