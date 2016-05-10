//
//  FirstPageTableHeadView.m
//  拉勾
//
//  Created by Steven on 16/4/27.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "FirstPageTableHeadView.h"

@implementation FirstPageTableHeadView

-(instancetype)initWithFrame:(CGRect)frame Titlearray:(NSArray *)titlearray
{
    
    if (self = [super initWithFrame:frame]) {
        CGFloat headBtnx = 0;
        CGFloat length = 0;
        CGFloat margin = 10;
        CGFloat BtnWidtY = 40;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, 100, 20)];
        label.text = @"热门职位";
        label.font = [UIFont systemFontOfSize:13];
        [self addSubview:label];
        for (int k = 0; k < titlearray.count; k ++) {
            headBtnx = headBtnx  + margin + length;
            _HeadViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
            length = [titlearray[k] boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 100) options:NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.width;
            [_HeadViewBtn setTitle:titlearray[k] forState:UIControlStateNormal];
            if ((headBtnx + length + 10) > [UIScreen mainScreen].bounds.size.width) {
                BtnWidtY = 0;
                headBtnx = 0;
                headBtnx = headBtnx  + margin;
                BtnWidtY = BtnWidtY + 50 +20;
            }
            _HeadViewBtn.frame = CGRectMake(headBtnx, BtnWidtY, length, 20);
            _HeadViewBtn.backgroundColor = [UIColor whiteColor];
            [_HeadViewBtn setTitleColor:[UIColor colorWithRed:0/255.f green:199/255.f blue:140/255.f alpha:1] forState:UIControlStateNormal];
            _HeadViewBtn.layer.cornerRadius = 10;
            _HeadViewBtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [_HeadViewBtn setTag:(100+k)];
            [self addSubview:_HeadViewBtn];
        }
    }
    return self;
}

@end
