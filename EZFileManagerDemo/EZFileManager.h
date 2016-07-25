//
//  EZFileManager.h
//  EZFileManagerDemo
//
//  Created by 李朋远 on 16/7/22.
//  Copyright © 2016年 李朋远. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EZFileManager : NSObject

+ (instancetype)sharedInstance;

/**
 *  获取documents的路径
 *
 *  @return 返回documents的路径
 */
+ (NSString *)documentsPath;

/**
 *  获取library的路径
 *
 *  @return 返回library的路径
 */
+(NSString *)libraryPath;

/**
 *  获取caches的路径
 *
 *  @return 返回caches的路径
 */
+(NSString *)cachesPath;

/**
 *  获取文件路径
 *
 *  @param fileName 文件名
 *
 *  @return 返回文件路径
 */
+(NSString *)documentsPath:(NSString *)fileName;
@end
