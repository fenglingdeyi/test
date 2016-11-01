//
//  BaseViewController.h
//  Helper
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 KaiQiangDong. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义一个宏，声明弱引用
#define WeakSelf __weak typeof(self) weakSelf = self

@interface BaseViewController : UIViewController

//创建上导航的左侧按钮
- (void)createNavigationBarLeftBarButtonItemWithTitle:(NSString *)title;
- (void)createNavigationBarLeftBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style;
- (void)createNavigationBarLeftBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;

//创建上导航左侧按钮(以view作模板)
- (void)createNavigationLeftButton:(id)view;

//创建上导航的右侧按钮
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title;
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style;
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;

//创建上导航右侧按钮(以view作模板)
- (void)createNavigationRightButton:(id)view;

//创建数据
- (void)initData;
//创建视图
- (void)createView;
//添加事件
- (void)addTouchAction;


-(void)createNavigationLeftButton;
-(void)createNavigationRightButton;
-(void)barButtonItemRight;
-(void)barButtonItemLeft;

//左侧行为
- (void)leftAction;
//右侧行为
- (void)rightAction;

//键盘弹出
- (void)keyboardShow:(NSNotification *)notification;
//键盘隐藏
- (void)keyboardHide:(NSNotification *)notification;

-(void)setLogo;

//用于强制转换屏幕
- (void)orientationToPortrait:(UIInterfaceOrientation)orientation;


@end

