//
//  NSData+AES.h
//  加密+解密
//
//  Created by hgdq on 16/6/27.
//  Copyright © 2016年 hgdq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

/**
 *  对data加密
 *
 *  @param data 需要加密的数据
 *
 *  @return 加密后的数据
 */
+(NSData *)aes256EncryptWithData:(NSData *)data;
/**
 *  对data解密
 *
 *  @param data 需要解密的数据
 *
 *  @return 解密后的数据
 */
+(NSData *)aes256DecryptWithData:(NSData *)data;
/**
 *  对字符串加密
 *
 *  @param string 需要加密的字符串
 *
 *  @return 加密后的数据
 */
+(NSData*)aes256EncryptWithString:(NSString*)string;
/**
 *  解密
 *
 *  @param data 需要解密的数据
 *
 *  @return 解密后的字符串
 */
+(NSString*)aes256DecryptStringWithData:(NSData *)data;

@end
