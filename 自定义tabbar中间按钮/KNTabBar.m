//
//  KNTabBar.m
//  自定义tabbar中间按钮
//
//  Created by 何凯楠 on 15/8/3.
//  Copyright (c) 2015年 何凯楠. All rights reserved.
//

#import "KNTabBar.h"

@interface KNTabBar()
/**
 *  添加按钮
 */
@property (nonatomic , weak) UIButton *addButton;

@end

@implementation KNTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
    
    }
    return self;
}

- (UIButton *)addButton
{
    if (!_addButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"tabbarBg"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"search-on"] forState:UIControlStateHighlighted];
//        [btn setBackgroundImage:[UIImage imageNamed:@"tabbarBg"] forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
        _addButton = btn;
        
        //是按钮的尺寸默认跟背景图片一样大
        [btn sizeToFit];
        
        [self addSubview:_addButton];
        
    }
    return _addButton;
}

/**
 *  中间增加按钮点击时间
 *
 *  @param click 按钮
 */
- (void)addClick:(UIButton *)click
{
    NSLog(@"click----");
}

/**
 *  调整空间位置
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / 5;
    CGFloat btnH = h;
    
    int i = 0;
    
    //1 , 遍历当前tabBar上的所有view
    for (UIView *tabBarBtn in self.subviews) {
        //2，如果是UITabBarButton，就取出来重新设置他们的位置
        if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            btnX = i * btnW;
            
            tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            //当到了第二个时候，再加一个位置空竹添加按钮的位置。
            if (i==1) {
                i++;
            }
            
            i++;
        }
    }
    
    //设置添加按钮 add按钮的位置
    self.addButton.center = CGPointMake(w * 0.5, h * 0.5);
    
}

@end
