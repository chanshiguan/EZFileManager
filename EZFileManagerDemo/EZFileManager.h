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

/**
 *  判断文件存在与否
 *
 *  @param filePath 文件路径
 *
 *  @return 是否存在结果
 */
- (BOOL)fileExistsAtPath:(NSString *)filePath;

/**
 *  根据路径创建文件夹
 *
 *  @param filePath 文件夹完整路径
 *
 *  @return 返回创建结果
 */
- (BOOL)createFolderAtPath:(NSString *)folderPath;
- (void)createFolderAtPath:(NSString *)folderPath block:(void(^)(BOOL result))block;

/**
 *  根据路径创建文件
 *
 *  @param filePath 文件完整路径
 *
 *  @return 返回创建结果
 */
- (BOOL)createFileAtPath:(NSString *)filePath;
- (void)createFileAtPath:(NSString *)filePath block:(void(^)(BOOL result))block;

/**
 *  根据路径删除文件
 *
 *  @param filePath 文件路径
 *
 *  @return 返回删除结果
 */
- (BOOL)removeFileAtPath:(NSString *)filePath;
- (void)removeFileAtPath:(NSString *)filePath block:(void(^)(BOOL result))block;

/**
 *  移动文件到指定目录下
 *
 *  @param srcPath    原路径
 *  @param targetPath 目标路径
 */
- (BOOL)moveItem:(NSString *)srcPath toDir:(NSString *)targetPath;
- (void)moveItem:(NSString *)srcPath toDir:(NSString *)targetPath block:(void(^)(BOOL result))block;

/**
 *  获取路径下所有文件
 *
 *  @param filePath 文件路径
 *
 *  @return 返回所有文件
 */
- (NSArray *)fetchAllFilesAtPath:(NSString *)filesPath;

/**
 *  设置文件自定义属性
 *
 *  @param costomAttributes 自定义属性
 *  @param filesPath        文件路径
 *
 *  @return 成功状态
 */
- (BOOL) setFileAttributes:(NSDictionary *)costomAttributes AtPath:(NSString *)filesPath;
/**
 *  获取路径下文件的详细信息
 *
 *  @param filePath 文件路径
 *
 *  @return 返回文件详细信息
 */
- (NSDictionary *)fileInfoAtPath:(NSString *)filePath;

/**
 *  读取文件
 *
 *  @param filePath 文件路径
 *
 *  @return 文件内容
 */
- (NSData *)dataWithFilePath:(NSString *)filePath;
@end
