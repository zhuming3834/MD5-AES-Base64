//
//  MD5.h
//  加密+解密
//
//  Created by hgdq on 16/6/27.
//  Copyright © 2016年 hgdq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5 : NSObject


/**
 *  MD5加密
 *
 *  @param string 需要加密的字符串
 *
 *  @return 返回加密后的结果
 */
+ (NSString *)md5:(NSString *)string;


@end
