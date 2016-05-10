//
//  ResumeState.m
//  拉勾
//
//  Created by Steven on 16/4/22.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "ResumeState.h"
#import "ResumeStateView.h"

#define KscreenW     [UIScreen mainScreen].bounds.size.width
#define KscreenH     [UIScreen mainScreen].bounds.size.height

@interface ResumeState ()<UIScrollViewDelegate,ResumeStateDelegate>
@property(nonatomic,strong)UIScrollView *ResumeStateScrollview;
@property(nonatomic,strong)ResumeStateView *resumestateview;
@property(nonatomic,assign)NSInteger currentIndex;
@end

@implementation ResumeState

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configResumeStateView];
    [self configScrollView];
    
}

-(void)configResumeStateView
{
    NSArray *array = @[@"全部",@"被查看",@"待沟通",@"面试",@"不合适"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"简历状态";
    _resumestateview = [[ResumeStateView alloc]initWithFrame:CGRectMake(0, 0, KscreenW, 35) WithTitleArray:array];
    [self.view addSubview:_resumestateview];
}
-(void)configScrollView
{
    _ResumeStateScrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 35, KscreenW, KscreenH-99)];
    [self.view addSubview:_ResumeStateScrollview];
    _ResumeStateScrollview.delegate = self;
    _resumestateview.resumeDelegate = self;
    //_ResumeStateScrollview.backgroundColor = [UIColor greenColor];
    //[_ResumeStateScrollview setContentSize:CGSizeMake(5*KscreenW, self.view.bounds.size.height-35)];
    _ResumeStateScrollview.pagingEnabled = YES;
    _ResumeStateScrollview.contentSize = CGSizeMake(5*KscreenW,KscreenH - 101);
    
}

#pragma scrollview delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    CGFloat page = scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    [_resumestateview ResumeSetContentofSet:page];
}


#pragma resumestatedelegate
-(void)ResumeStateViewDidScrollWhenScrollViewDidScroll:(CGFloat)page
{
    [_ResumeStateScrollview setContentOffset:CGPointMake(page*KscreenW, 0)];
}

@end
