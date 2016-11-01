//
//  Check.m
//  Simple
//
//  Created by dongkaiqiang on 16/8/8.
//  Copyright © 2016年 kaiqiang. All rights reserved.
//

#import "Check.h"

@implementation Check


+ (BOOL)checkTelNumber:(NSString*) telNumber{

    NSString*pattern =@"^1+[3578]+\\d{9}";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    
    return isMatch;
}
//    private static final String REGEX_MOBILE_EXACT = "^((13[0-9])|(14[5,7])|(15[0-3,5-8])|(17[0,3,5-8])|(18[0-9])|(147))\\d{8}$";

+(BOOL)checkPhoneNumber:(NSString *)telNumber{

    NSString*pattern =@"^((13[0-9])|(14[5,7])|(15[0-3,5-8])|(17[0,3,5-8])|(18[0-9])|(147))\\d{8}$";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    
    return isMatch;
}


+(BOOL) checkphoneTelNumbel:(NSString *)telNumber{

    NSString*pattern =@"^0\\d{2,3}[- ]?\\d{7,8}";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    
    return isMatch;

}

+ (BOOL)checkPassword:(NSString*) password{

    
    NSString*pattern =@"[a-zA-Z0-9]\\w{5,17}";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:password];
    
    return isMatch;

}

+ (BOOL)checkUserIdCard:(NSString*)idCard{

    NSString*pattern =@"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;

}

+ (BOOL)checkURL : (NSString*) url{

    NSString*pattern =@"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:url];
    
    return isMatch;
}

+(BOOL) checkEmail:(NSString *)email{

    NSString*pattern =@"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:email];
    
    return isMatch;
}

//
+(BOOL) checkName:(NSString *)userName{
    
    NSString*pattern =@"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch = [pred evaluateWithObject:userName];
    
    return isMatch;

}





@end
