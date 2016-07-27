#EZFileManager
为大家提供一个可以快速操作文件的工具类。
-------------------------
##使用
* add "EZFileManager" files to your project   //导入EZFileManager文件到项目中
* #import "EZFileManager.h"

##初始化
* EZFileManager *fileManager = [EZFileManager sharedInstance];

##所提供的方法
``` objective-c
* + (NSString *)documentsPath;  //获取documents的路径
* + (NSString *)libraryPath;     //获取library的路径
* + (NSString *)cachesPath;      //获取caches的路径
* + (NSString *)documentsPath:(NSString *)fileName;    //获取文件路径
* - (BOOL)fileExistsAtPath:(NSString *)filePath;      //判断文件存在与否
* - (BOOL)createFolderAtPath:(NSString *)folderPath;  //根据路径创建文件夹
* - (void)createFolderAtPath:(NSString *)folderPath block:(void(^)(BOOL result))block;    //根据路径创建文件夹
* - (BOOL)createFileAtPath:(NSString *)filePath;      //根据路径创建文件
* - (void)createFileAtPath:(NSString *)filePath block:(void(^)(BOOL result))block;        //根据路径创建文件
* - (BOOL)removeFileAtPath:(NSString *)filePath;      //根据路径删除文件
* - (void)removeFileAtPath:(NSString *)filePath block:(void(^)(BOOL result))block;        //根据路径删除文件
* - (BOOL)moveItem:(NSString *)srcPath toDir:(NSString *)targetPath;                      //移动文件到指定目录下
* - (void)moveItem:(NSString *)srcPath toDir:(NSString *)targetPath block:(void(^)(BOOL result))block;//移动文件到指定目录下
* - (NSArray *)fetchAllFilesAtPath:(NSString *)filesPath;   //获取路径下所有文件
* - (BOOL) setFileAttributes:(NSDictionary *)costomAttributes AtPath:(NSString *)filesPath; //设置文件自定义属性
* - (NSDictionary *)fileInfoAtPath:(NSString *)filePath;  //获取路径下文件的详细信息
* - (NSData *)dataWithFilePath:(NSString *)filePath;  //读取文件
```
