//
//  SIXLifeModel.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/27.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXLifeModel.h"
#import "FMDBManager.h"

@implementation SIXLifeModel

- (instancetype)loadModelWithKeyword:(NSString *)keyword {
    FMDatabase *database = [FMDBManager sharedDatabase];
    FMResultSet *resultSet = [database executeQueryWithFormat:@"select * from T_LIFE where D_AUTHOR = %@", keyword];
    while ([resultSet next]) {
        _model = [SIXLifeModel new];
        _model.title = [resultSet stringForColumn:@"D_TITLE"];
        _model.author = [resultSet stringForColumn:@"D_AUTHOR"];
        if (![resultSet stringForColumn:@"D_IMAGEURL"]) {
            _model.imageUrl = @"defaultHead";
        }else {
            _model.imageUrl = [resultSet stringForColumn:@"D_IMAGEURL"];
        }
        _model.introduction = [resultSet stringForColumn:@"D_INTRODUCTION"];
    }
    [database close];
    return _model;
}

@end
