//
//  MD5.m
//  加密+解密
//
//  Created by hgdq on 16/6/27.
//  Copyright © 2016年 hgdq. All rights reserved.
//

#import "MD5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation MD5


/**
 *  MD5加密
 *
 *  @param string 需要加密的字符串
 *
 *  @return 返回加密后的结果
 */
+ (NSString *)md5:(NSString *)string{
    // OC 字符串转换位C字符串
    const char *cStr = [string UTF8String];
    // 16位加密
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    // 1: 需要加密的C字符串
    // 2: 加密的字符串的长度
    // 3: 加密长度
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2]; // 32位
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02X", digest[i]];
    }
    // 返回一个32位长度的加密后的字符串
    return result;
}



@end
