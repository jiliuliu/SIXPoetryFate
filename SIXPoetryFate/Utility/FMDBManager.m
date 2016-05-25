//
//  FMDBManager.m
//  SIXPoetryFate
//
//  Created by tarena on 16/5/18.
//  Copyright © 2016年 six. All rights reserved.
//

#import "FMDBManager.h"
#import "SIXPoetryModel.h"

@implementation FMDBManager

+ (FMDatabase *)sharedDatabase {
    static FMDatabase *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Poetry.bundle" ofType:nil];
        NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *sourceDBPath = [bundlePath stringByAppendingPathComponent:@"sqlite.db"];
        NSString *targetDBPath = [documentsPath stringByAppendingPathComponent:@"poetryfate.db"];
        
        if (![fileManager fileExistsAtPath:targetDBPath]) {
            NSError *error = nil;
            [fileManager copyItemAtPath:sourceDBPath toPath:targetDBPath error:&error];
            if(error)  NSLog(@"数据库文件移动失败：%@", error);
        }
        database = [FMDatabase databaseWithPath:targetDBPath];
    });
    [database open];
    return database;
}

+ (void)collectPoetry:(SIXPoetryModel *)poetry {
    
    FMDatabase *database = [FMDBManager sharedDatabase];
    FMResultSet *resultSet = [database executeQueryWithFormat:@"select * from T_SHI where D_TITLE = %@ and D_KIND = '我的收藏'", poetry.poemTitle];
    BOOL ret = NO;
    
    if ([resultSet next]) {
        
        if (![poetry.poemKindName isEqualToString:@"我的收藏"]) {
            ret = [database executeUpdateWithFormat:@"update T_SHI set D_COLLECT = %d where D_TITLE = %@", poetry.collected, poetry.poemTitle];
            NSLog(@"设置收藏属性：%@", ret ? poetry.poemTitle : database.lastError);
        }
        //已经收藏过了
        ret = [database executeUpdateWithFormat:@"delete from T_SHI where D_TITLE = %@ and D_KIND = '我的收藏'", poetry.poemTitle];
        NSLog(@"删除：%@", ret ? poetry.poemTitle : database.lastError);
    } else {
        
        if (![poetry.poemKindName isEqualToString:@"我的收藏"]) {
            ret = [database executeUpdateWithFormat:@"update T_SHI set D_COLLECT = %d where D_TITLE = %@", poetry.collected, poetry.poemTitle];
            NSLog(@"设置收藏属性：%@", ret ? poetry.poemTitle : database.lastError);
        }
        //没有收藏过,现在收藏
        ret = [database executeUpdateWithFormat:@"insert into T_SHI (D_SHI, D_INTROSHI, D_AUTHOR, D_KIND, D_TITLE, D_COLLECT) values (%@, %@, %@, %@, %@, %d)", poetry.poemContent, poetry.poemDescription, poetry.poemAuthor, @"我的收藏", poetry.poemTitle, poetry.collected];
        poetry.collected = YES;
        NSLog(@"收藏：%@", ret ? poetry.poemTitle : database.lastError);
    }
    
    [database close];
}

+ (void)savePoetryComment:(SIXPoetryModel *)poetry {
    FMDatabase *database = [FMDBManager sharedDatabase];
    BOOL ret = NO;
    ret = [database executeUpdateWithFormat:@"update T_SHI set D_COMMENT = %@ where D_TITLE = %@", poetry.poemComment, poetry.poemTitle];
    NSLog(@"添加评论：%@", ret ? poetry.poemComment : database.lastError);
    [database close];
}

+ (void)selectPoetryWithKeyword:(NSString *)keyword withBlock:(void (^)(NSArray *))block {
    FMDatabase *database = [FMDBManager sharedDatabase];
    FMResultSet *resultSet = [database executeQueryWithFormat:@"select D_TITLE from T_SHI where D_TITLE = %@", keyword];
    NSMutableArray *mutArr = [NSMutableArray array];
    while ([resultSet next]) {
        [mutArr addObject:[resultSet stringForColumn:@"D_TITLE"]];
    }
    resultSet = [database executeQueryWithFormat:@"select D_TITLE from T_SHI where D_AUTHOR = %@", keyword];
    while ([resultSet next]) {
        [mutArr addObject:[resultSet stringForColumn:@"D_TITLE"]];
    }
    [database close];
    block(mutArr.copy);
}

@end
