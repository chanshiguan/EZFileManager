//
//  EZFileManager.m
//  EZFileManagerDemo
//
//  Created by 李朋远 on 16/7/22.
//  Copyright © 2016年 李朋远. All rights reserved.
//

#import "EZFileManager.h"

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


@end
