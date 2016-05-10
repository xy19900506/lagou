//
//  TabbarController.m
//  拉勾
//
//  Created by Steven on 16/4/20.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "TabbarController.h"
#import "FirstPageControllerViewController.h"
#import "MessageViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfigTabbarController];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)ConfigTabbarController
{
    FirstPageControllerViewController *First = [[FirstPageControllerViewController alloc]init];
    UINavigationController *firstNavi = [[UINavigationController alloc]initWithRootViewController:First];
    
    MessageViewController *Message = [[MessageViewController alloc]init];
    UINavigationController *messageNavi = [[UINavigationController alloc]initWithRootViewController:Message];
    
    FindViewController *Find = [[FindViewController alloc]init];
    UINavigationController *findNavi = [[UINavigationController alloc]initWithRootViewController:Find];
    
    MeViewController *Me = [[MeViewController alloc]init];
    self.viewControllers = @[firstNavi,messageNavi,findNavi,Me];
    
    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"icon_home_nor"] selectedImage:[UIImage imageNamed:@"icon_home_pre"]];
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"icon_message_nor"] selectedImage:[UIImage imageNamed:@"icon_message_pre"]];
    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"icon_find_nor"] selectedImage:[UIImage imageNamed:@"icon_find_pre"]];
    UITabBarItem *item4 = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"icon_user_nor"] selectedImage:[UIImage imageNamed:@"icon_user_pre"]];
    
    firstNavi.tabBarItem = item1;
    messageNavi.tabBarItem = item2;
    findNavi.tabBarItem = item3;
    Me.tabBarItem = item4;
    self.tabBarController.tabBar.items = @[item1,item2,item3,item4];
    self.tabBar.tintColor = [UIColor colorWithRed:0/255.f green:199/255.f blue:140/255.f alpha:1];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
