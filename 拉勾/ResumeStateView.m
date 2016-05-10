//
//  ResumeStateView.m
//  拉勾
//
//  Created by Steven on 16/4/22.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "ResumeStateView.h"

#define  KscreenW       [UIScreen mainScreen].bounds.size.width

@implementation ResumeStateView

-(instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titlearray
{

    self = [super initWithFrame:frame];
    if (self) {
         _ButtonW = KscreenW/(titlearray.count+1)*1.f;
         _Margin = (KscreenW/6.f-10)/(titlearray.count-1);
        NSMutableArray *titlebuttonarr = [NSMutableArray array];
        for (int i = 0; i < titlearray.count; i ++) {
            _TitleButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _TitleButton.frame = CGRectMake(5+i*(_ButtonW + _Margin),3 , _ButtonW, 25);
            //[[UIButton alloc]initWithFrame:CGRectMake(5+i*(_ButtonW + _Margin),3 , _ButtonW, 25)];
            //_TitleButton.backgroundColor = [UIColor whiteColor];
            [_TitleButton setTitle:titlearray[i] forState:UIControlStateNormal];
            _TitleButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
            [_TitleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [_TitleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            _TitleButton.titleLabel.textAlignment = 1;
            [_TitleButton addTarget:self action:@selector(ClickTitleButton:) forControlEvents:UIControlEventTouchUpInside];
            self.backgroundColor = [UIColor lightGrayColor];
            [_TitleButton setTag:10+i];
            [self addSubview:_TitleButton];
            [titlebuttonarr addObject:_TitleButton];
            _TitleBtnArray = titlebuttonarr;
        }
        self.index = 0;
        _indicatorView = [[UIView alloc]initWithFrame:CGRectMake(5, 32, _ButtonW, 3)];
        [self addSubview:_indicatorView];
        _indicatorView.backgroundColor = [UIColor colorWithRed:46/255.f green:139/255.f blue:87/255.f alpha:1];
    }
    return self;
}

-(IBAction)ClickTitleButton:(UIButton *)sender
{
    self.index = sender.tag - 10;
    
//    CGFloat indicatorX = sender.center.x;
//    _indicatorView.center = CGPointMake(indicatorX, 33.5);
//    [_resumeDelegate ResumeStateViewDidScrollWhenScrollViewDidScroll:sender.tag];
    
}

-(void)setIndex:(NSInteger)index
{
    UIButton *NotSelectBtn = _TitleBtnArray[_index];
    NotSelectBtn.selected = NO;
    UIButton *SelectBtn = _TitleBtnArray[index];
    SelectBtn.selected = YES;
    _index = index;
    CGRect frame = _indicatorView.frame;
    frame.origin.x = 5+_index*(_ButtonW + _Margin);
    _indicatorView.frame = frame;
    [_resumeDelegate ResumeStateViewDidScrollWhenScrollViewDidScroll:_index];
    
    
}

-(void)ResumeSetContentofSet:(CGFloat)page
{
   [_indicatorView setFrame:CGRectMake(5+page*(_ButtonW + _Margin), 32, KscreenW/6.f, 3)];
}
@end
