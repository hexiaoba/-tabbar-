//
//  KNTabBarController.m
//  自定义tabbar中间按钮
//
//  Created by 何凯楠 on 15/8/3.
//  Copyright (c) 2015年 何凯楠. All rights reserved.
//

#import "KNTabBarController.h"
#import "KNTabBar.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface KNTabBarController ()

@end

@implementation KNTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadUI];
    
    /*调用自定义tabbar，增加中间tabbar按钮*/
    KNTabBar *tabBar = [[KNTabBar alloc] initWithFrame:self.tabBar.frame];
    [self setValue:tabBar forKey:@"tabBar"];
}


-(void)loadUI
{
    ViewController *oneVC = [[ViewController alloc] init];
    oneVC.title = @"首页";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:oneVC];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.title = @"专题";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    thirdVC.title = @"搭配";
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    
    FourthViewController *fourthVC = [[FourthViewController alloc] init];
    fourthVC.title = @"我的";
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:fourthVC];
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < self.viewControllers.count; i++) {
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d_normal",i+1]] selectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_%d_selected",i+1]]];
        [items addObject:tabBarItem];
    }
    for (int i = 0; i < self.viewControllers.count; i++) {
        UINavigationController *nav = self.viewControllers[i];
        UITabBarItem *tabBarItem = items[i];
        nav.tabBarItem = tabBarItem;
    }
}


@end
