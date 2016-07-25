//
//  ViewController.m
//  EZFileManagerDemo
//
//  Created by 李朋远 on 16/7/22.
//  Copyright © 2016年 李朋远. All rights reserved.
//

#import "ViewController.h"
#import "EZFileManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EZFileManager *fileManager = [EZFileManager sharedInstance];
    NSString *path = [EZFileManager documentsPath:@"1.zip"];
    [fileManager setFileAttributes:@{@"test":@"tes1111t"} AtPath:path];
    NSDictionary *dic = [fileManager fileInfoAtPath:path];
    NSLog(@"dic= %@",dic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
