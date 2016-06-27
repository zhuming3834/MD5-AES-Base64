//
//  NSData+Base64.h
//  加密+解密
//
//  Created by hgdq on 16/6/27.
//  Copyright © 2016年 hgdq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)


/**
 *  数据流加密
 *
 *  @param data 需要加密的数据流
 *
 *  @return 加密后的字符串
 */
+(NSString *)base64EncodedWithData:(NSData *)data;

/**
 *  字符串解密
 *
 *  @param base64EncodedString 需要解密的字符串
 *
 *  @return 解密后的数据流
 */
+(NSData *)base64DecryptWithString:(NSString *)base64EncodedString;

/**
 *  字符串做加密
 *
 *  @param str 需要加密的字符串
 *
 *  @return 加密后的字符串
 */
+(NSString *)base64EncodedWithString:(NSString *)str;
/**
 *  对字符串解密
 *
 *  @param base64EncodedString 需要解密的字符串
 *
 *  @return 解密后的字符串
 */
+ (NSString *)base64DecryptString:(NSString *)base64EncodedString;

@end
