//
//  SearchInfoController.m
//  拉勾
//
//  Created by Steven on 16/4/27.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "SearchInfoController.h"

@interface SearchInfoController ()

@end
@implementation SearchInfoController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self configBackbutton];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)configBackbutton
{
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(BackButtonAction:)];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

-(IBAction)BackButtonAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
