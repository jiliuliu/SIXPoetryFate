//
//  SIXPoetryListModel.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXPoetryListModel.h"
#import "FMDB.h"
#import "FMDBManager.h"

@implementation SIXPoetryListModel

- (NSArray<SIXPoetryListModel *> *)loadModelsWithKindName:(NSString *)kindName {
    FMDatabase *database = [FMDBManager sharedDatabase];
    FMResultSet *resultSet = [database executeQueryWithFormat:@"select * from T_SHI where D_KIND = %@", kindName];
    if (!resultSet) {
        NSLog(@"诗歌名单数据提取失败。");
        return nil;
    }
    NSMutableArray *mutArr = [NSMutableArray array];
    while ([resultSet next]) {
        SIXPoetryListModel *model = [SIXPoetryListModel new];
        model.poemAuthor = [resultSet stringForColumn:@"D_AUTHOR"];
        model.poemTitle = [resultSet stringForColumn:@"D_TITLE"];
        [mutArr addObject:model];
    }
    [database close];
    _models = mutArr;
    return _models;
}

@end
