//
//  EZFileManager.m
//  EZFileManagerDemo
//
//  Created by 李朋远 on 16/7/22.
//  Copyright © 2016年 李朋远. All rights reserved.
//

#import "EZFileManager.h"
@interface EZFileManager ()
@property (nonatomic, weak) NSFileManager *fileManager;
@end

@implementation EZFileManager

static EZFileManager *instance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _fileManager = [NSFileManager defaultManager];
    }
    return self;
}

- (NSString *)pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSString *)documentsPath
{
    return [[self sharedInstance] pathForDirectory:NSDocumentDirectory];
}

+(NSString *)libraryPath
{
    return [[self sharedInstance] pathForDirectory:NSLibraryDirectory];
}

+(NSString *)cachesPath
{
    return [[self sharedInstance] pathForDirectory:NSCachesDirectory];
}

+(NSString *)documentsPath:(NSString *)fileName
{
    return [[self  documentsPath] stringByAppendingPathComponent:fileName];
}

- (BOOL)fileExistsAtPath:(NSString *)filePath
{
    return [_fileManager fileExistsAtPath:filePath];
}

- (BOOL)createFolderAtPath:(NSString *)folderPath
{
    return [_fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
}

- (void)createFolderAtPath:(NSString *)folderPath block:(void(^)(BOOL result))block
{
    block([self createFileAtPath:folderPath]);
}

- (BOOL)createFileAtPath:(NSString *)filePath
{
    return [_fileManager createFileAtPath:filePath contents:nil attributes:nil];
}

- (void)createFileAtPath:(NSString *)filePath block:(void(^)(BOOL result))block
{
    block([self createFileAtPath:filePath]);
}

- (BOOL)removeFileAtPath:(NSString *)filePath
{
    return [_fileManager removeItemAtPath:filePath error:nil];
}

- (void)removeFileAtPath:(NSString *)filePath block:(void(^)(BOOL result))block
{
    block([self removeFileAtPath:filePath]);
}

- (BOOL)moveItem:(NSString *)srcPath toDir:(NSString *)targetPath
{
    return [_fileManager moveItemAtPath:srcPath toPath:targetPath error:nil];
}

- (void)moveItem:(NSString *)srcPath toDir:(NSString *)targetPath block:(void(^)(BOOL result))block
{
    block([self moveItem:srcPath toDir:targetPath]);
}

- (NSArray *)fetchAllFilesAtPath:(NSString *)filesPath
{
    return [_fileManager contentsOfDirectoryAtPath:filesPath error:nil];
}

- (BOOL) setFileAttributes:(NSDictionary *)costomAttributes AtPath:(NSString *)filesPath
{
    
    NSDictionary *extendedAttributes = [NSDictionary dictionaryWithObject:[self changeValue:costomAttributes byEncoded:NSUTF8StringEncoding]
                                                                   forKey:@"NSFileExtendedAttributes"];
    
    NSError *error = NULL;
    BOOL sucess = [[NSFileManager defaultManager] setAttributes:extendedAttributes
                                                   ofItemAtPath:filesPath error:&error];
    return sucess;
}

- (NSDictionary *)fileInfoAtPath:(NSString *)filePath
{
    NSDictionary *fileAttributes = [_fileManager attributesOfItemAtPath:filePath error:nil];
    if (fileAttributes != nil) {
        NSNumber *fileSize = [fileAttributes objectForKey:NSFileSize];
        NSString *fileOwner = [fileAttributes objectForKey:NSFileOwnerAccountName];
        NSDate *fileModDate = [fileAttributes objectForKey:NSFileModificationDate];
        NSDate *fileCreateDate = [fileAttributes objectForKey:NSFileCreationDate];
        BOOL fileHidden = [fileAttributes objectForKey:NSFileExtensionHidden];
        NSDictionary *fileAttribute = [self changeValue:[fileAttributes objectForKey:@"NSFileExtendedAttributes"] byEncoded:NSUTF8StringEncoding];
        
        return @{@"size":fileSize?:[NSNumber numberWithInt:0],
                 @"owner":fileOwner?:@"",
                 @"updateTime":fileModDate,
                 @"creatTime":fileCreateDate,
                 @"path":filePath,
                 @"hidden":[NSNumber numberWithBool:fileHidden],
                 @"customAttributes":fileAttribute?:@{}};
    }
    else {
        return @{};
    }
}

- (NSDictionary *)changeValue:(NSDictionary *)fileInfo byEncoded:(NSStringEncoding)encoding
{
    NSMutableDictionary *newFileInfo = [NSMutableDictionary dictionary];
    for (NSString *key in [fileInfo allKeys]) {
        id value = [fileInfo objectForKey:key];
        
        if ([value isKindOfClass:[NSData class]]){
            NSString *newString = [[NSString alloc] initWithData:value encoding:NSUTF8StringEncoding];
            [newFileInfo setObject:newString forKey:key];
        } else {
            NSAssert([value isKindOfClass:[NSString class]], @"attribute must be string");
            NSData *newData = [value dataUsingEncoding:encoding];
            [newFileInfo setObject:newData forKey:key];
        }
    }
    return newFileInfo;
}

- (NSData *)dataWithFilePath:(NSString *)filePath
{
    if ([self fileExistsAtPath:filePath]) {
        return [NSData dataWithContentsOfFile:filePath];
    } else {
        return nil;
    }
}
@end
