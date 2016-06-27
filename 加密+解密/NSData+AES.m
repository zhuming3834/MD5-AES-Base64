//
//  NSData+AES.m
//  加密+解密
//
//  Created by hgdq on 16/6/27.
//  Copyright © 2016年 hgdq. All rights reserved.
//

#import "NSData+AES.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

// 自定义一个KEY
#define AES_KEY  @"0123456789ABCDEF"

@implementation NSData (AES)

/**
 *  对data加密
 *
 *  @param data 需要加密的数据
 *
 *  @return 加密后的数据
 */
+(NSData *)aes256EncryptWithData:(NSData *)data{
    if (!AES_KEY || AES_KEY.length !=16) {
        NSLog(@"key length must be 16");
        return nil;
    }
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [AES_KEY getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = data.length;
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          data.bytes, dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

/**
 *  对data解密
 *
 *  @param data 需要解密的数据
 *
 *  @return 解密后的数据
 */
+(NSData *)aes256DecryptWithData:(NSData *)data{
    if (!AES_KEY || AES_KEY.length !=16) {
        NSLog(@"key length must be 16");
        return nil;
    }
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [AES_KEY getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = data.length;
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          data.bytes, dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}

/**
 *  对字符串加密
 *
 *  @param string 需要加密的字符串
 *
 *  @return 加密后的数据
 */
+(NSData*)aes256EncryptWithString:(NSString*)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [self aes256EncryptWithData:data];
    return encryptedData;
}

/**
 *  解密
 *
 *  @param data 需要解密的数据
 *
 *  @return 解密后的字符串
 */
+(NSString*)aes256DecryptStringWithData:(NSData *)data{

    NSData *decryData = [self aes256DecryptWithData:data];
    NSString *string = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
    return string;
}



@end
