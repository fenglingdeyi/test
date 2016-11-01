//
//  Check.h
//  Simple
//
//  Created by dongkaiqiang on 16/8/8.
//  Copyright © 2016年 kaiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Check : NSObject

@property (nonatomic,copy) NSString *token;

//验证手机号
//手机号简单
+ (BOOL)checkTelNumber:(NSString*) telNumber;

//手机号复杂
+(BOOL)checkPhoneNumber:(NSString *)telNumber;

//座机
+(BOOL) checkphoneTelNumbel:(NSString *)telNumbel;

#pragma 正则匹配用户密码6-18位数字和字母_组合

+ (BOOL)checkPassword:(NSString*) password;
#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard:(NSString*)idCard;

#pragma 正则匹配URL

+ (BOOL)checkURL : (NSString*) url;
//验证邮箱
+(BOOL) checkEmail:(NSString *)email;

//输入只能是中文、英文和下划线
+(BOOL) checkName:(NSString *)userName;











@end
