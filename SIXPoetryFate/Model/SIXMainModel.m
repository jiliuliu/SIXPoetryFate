//
//  SIXMainModel.m
//  SIXPoetryFate
//
//  Created by tarena on 16/5/18.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXMainModel.h"
#import "FMDBManager.h"
#import "FMDB.h"


@implementation SIXMainModel

- (NSArray<SIXMainModel *> *)models {
    if (!_models) {
        NSMutableArray *mutArray = [NSMutableArray array];
        FMDatabase *database = [FMDBManager sharedDatabase];
        FMResultSet *resultSet = [database executeQuery:@"select D_KIND from T_KIND"];
        if (!resultSet) {
            NSLog(@"诗歌类别名单数据提取失败。");
            return nil;
        }
        while ([resultSet next]) {
            SIXMainModel *mainModel = [SIXMainModel new];
            mainModel.kindName = [resultSet stringForColumn:@"D_KIND"];
            [mutArray addObject:mainModel];
        }
        _models = mutArray.copy;
        [database close];
    }
    return _models;
}

@end
