//
//  DetailJobShareView.m
//  拉勾
//
//  Created by Steven on 16/5/9.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "DetailJobShareView.h"
#define KscreenW     [UIScreen mainScreen].bounds.size.width
#define KscreenH     [UIScreen mainScreen].bounds.size.height

@implementation DetailJobShareView

-(instancetype)initWithButtonArray:(NSArray *)buttonarray AndTitleArray:(NSArray *)titlearray
{
    if (self = [super init]) {
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        self.frame = window.bounds;
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, KscreenH - 130, KscreenW, 130)];
        _contentView.backgroundColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1];
        CGFloat margin = 20;
        CGFloat buttonW = (KscreenW-6*margin)/5.f;
        for (int k = 0; k < buttonarray.count; k ++) {
            _shareIconBtn = [[UIButton alloc]initWithFrame:CGRectMake(margin+k*(buttonW + margin), 10, buttonW, buttonW)];
            [_shareIconBtn setImage:[UIImage imageNamed:buttonarray[k]] forState:UIControlStateNormal];
            [_contentView addSubview:_shareIconBtn];
            _shareLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin+k*(margin + buttonW), 13+buttonW, buttonW, 15)];
            _shareLabel.text = titlearray[k];
            _shareLabel.backgroundColor = [UIColor clearColor];
            _shareLabel.font = [UIFont systemFontOfSize:9.f];
            _shareLabel.textColor = [UIColor darkGrayColor];
            _shareLabel.textAlignment = 1;
            [_contentView addSubview:_shareLabel];
        }
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(margin, 33+buttonW, KscreenW - 2*margin, 40)];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_contentView addSubview:_cancelBtn];
        _cancelBtn.layer.cornerRadius = 4;
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_contentView];
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
        
    }
    return self;
}

-(void)show
{
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    [window addSubview:self];
}


-(void)cancelBtnClick:(UIButton *)sender
{
    if ([_Delegate respondsToSelector:@selector(ShareViewCancelBtnClick:)]&& _Delegate) {
        [_Delegate ShareViewCancelBtnClick:sender];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:window];
    if (point.y > 0 && point.y <KscreenH - 130) {
        [self removeFromSuperview];
    }
}










@end
