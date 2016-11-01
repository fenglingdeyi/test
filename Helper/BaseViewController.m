//
//  BaseViewController.m
//  Helper
//
//  Created by qianfeng on 15/10/14.
//  Copyright (c) 2015年 KaiQiangDong. All rights reserved.
//

//
/*********** 新增 ***********/
/*
 2015.09.12 凌晨1：08
 更新BaseViewController内容
 1.添加右侧按钮的实例化
 2.添加右侧和左侧按钮的自定义实例化
 3.添加右侧按钮的默认行为
 4.添加视图将要加载时添加键盘事件的通知
 5.添加视图将要消失时移除键盘事件的通知
 */
/*********** 新增 ***********/

#import "BaseViewController.h"
#import "LoginViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

@interface BaseViewController ()

@end

@implementation BaseViewController


-(void)useShadowImageRemoveBlackLine
{
    //通过设置shadowImage移除黑线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //给上导航栏添加背景色
   // self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
   self.navigationController.navigationBar.barTintColor = RGB(0, 0, 0);
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
     self.navigationController.navigationBar.translucent = NO;
  self.view.backgroundColor = RGB(248, 248, 248);
    
    //调用初始化数据
    [self initData];
    //调用创建视图
    [self createView];
    //调用添加事件
    [self addTouchAction];
}

/*********** 新增 ***********/
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /*
     将要做还没有做的时候提醒
     */
    //注册键盘将要弹出的提醒
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    //注册键盘将要消失时的提醒
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

/*********** 新增 ***********/
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //移除一切编辑状态
    [self.view endEditing:YES];
    //移除注册的键盘将要显示的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    //移除注册的键盘将要隐藏的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

//创建数据
- (void)initData {
    //我们只实现框架，不实现内容，主要是为了消除警告
}

//创建视图
- (void)createView {
    //我们只实现框架，不实现内容，主要是为了消除警告
}

//添加事件
- (void)addTouchAction {
    //我们只实现框架，不实现内容，主要是为了消除警告
}

//创建上导航的左侧按钮
- (void)createNavigationBarLeftBarButtonItemWithTitle:(NSString *)title {
    [self createNavigationBarLeftBarButtonItemWithTitle:title style:UIBarButtonItemStylePlain];
}

- (void)createNavigationBarLeftBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style {
    [self createNavigationBarLeftBarButtonItemWithTitle:title style:style target:self action:@selector(leftAction)];
}

- (void)createNavigationBarLeftBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
    //这个可以简单的理解为特殊的按钮，不需要我们去考虑布局，只要实现样式和内容，系统为我们进行布局。
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
    self.navigationItem.leftBarButtonItem = left;
}

/*********** 新增 ***********/
//创建上导航左侧按钮(以view作模板)
- (void)createNavigationLeftButton:(id)view {
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = leftItem;
}

/*********** 新增 ***********/
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title {
    [self createNavigationBarRightBarButtonItemWithTitle:title style:UIBarButtonItemStylePlain];
}

/*********** 新增 ***********/
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style {
    [self createNavigationBarRightBarButtonItemWithTitle:title style:style target:self action:@selector(rightAction)];
}

/*********** 新增 ***********/
- (void)createNavigationBarRightBarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action {
    //这个可以简单的理解为特殊的按钮，不需要我们去考虑布局，只要实现样式和内容，系统为我们进行布局。
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
    self.navigationItem.rightBarButtonItem = right;
}

/*********** 新增 ***********/
//创建上导航右侧按钮(以view作模板)
- (void)createNavigationRightButton:(id)view {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = rightItem;
}

//左侧按钮的默认行为
- (void)leftAction {
    //我们只实现框架，不实现内容，主要是为了消除警告
}

/*********** 新增 ***********/
//右侧按钮的默认行为
- (void)rightAction {
    //我们只实现框架，不实现内容，主要是为了消除警告
}

/*********** 新增 ***********/
//键盘弹出
- (void)keyboardShow:(NSNotification *)notification {
    
}

/*********** 新增 ***********/
//键盘隐藏
- (void)keyboardHide:(NSNotification *)notification {
    
}

-(void)setLogo{
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 80) / 2, 2, 80, 40)];
    [image setImage:[UIImage imageNamed:@"logo@2x.png"]];
    self.navigationItem.titleView = image;

}

//添加导航栏左侧按钮
-(void)createNavigationLeftButton{
    
    UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [customButton addTarget:self action:@selector(barButtonItemLeft) forControlEvents:UIControlEventTouchUpInside];
    [customButton setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    self.navigationItem.leftBarButtonItem = barItem;
}


//添加导航栏右侧侧按钮
-(void)createNavigationRightButton{
    
    UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [customButton addTarget:self action:@selector(barButtonItemRight) forControlEvents:UIControlEventTouchUpInside];
    [customButton setTitle:@"退出" forState:UIControlStateNormal];
    [customButton setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    UIBarButtonItem* leftBtnItem = [[UIBarButtonItem alloc]initWithCustomView:customButton];
    self.navigationItem.rightBarButtonItem = leftBtnItem;
    
}


-(void)barButtonItemRight{
    
     [ShareSDK cancelAuthorize:SSDKPlatformTypeQQ];
    [ShareSDK cancelAuthorize:SSDKPlatformTypeWechat];
    NSUserDefaults *userInfo = [NSUserDefaults standardUserDefaults];
    [userInfo setObject:@"0" forKey:@"isLogin"];
    LoginViewController *lvc = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lvc];
    UIWindow *Keywindow = [UIApplication sharedApplication].keyWindow;
    Keywindow.rootViewController = nav;

}


-(void)barButtonItemLeft{

    [self.navigationController popViewControllerAnimated:NO];
}



//用于强制转换屏幕
- (void)orientationToPortrait:(UIInterfaceOrientation)orientation {
    
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[UIDevice currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];//前两个参数已被target和selector占用
    [invocation invoke];
    
   // NSLog(@"*************************");
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
