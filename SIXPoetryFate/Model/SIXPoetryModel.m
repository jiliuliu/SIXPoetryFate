//
//  SIXPoetryModel.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXPoetryModel.h"
#import "FMDBManager.h"
#import "AFNetworking.h"

@implementation SIXPoetryModel

- (SIXPoetryModel *)loadModelWithPoemTitle:(NSString *)poemTitle {
    FMDatabase *database = [FMDBManager sharedDatabase];
    FMResultSet *resultSet = [database executeQueryWithFormat:@"select * from T_SHI where D_TITLE = %@", poemTitle];
    if (!resultSet) {
        NSLog(@"诗歌名单数据提取失败。");
        return nil;
    }
    _model = [SIXPoetryModel new];
    while ([resultSet next]) {
        _model.poemAuthor = [resultSet stringForColumn:@"D_AUTHOR"];
        _model.poemTitle = [resultSet stringForColumn:@"D_TITLE"];
        _model.poemContent = [resultSet stringForColumn: @"D_SHI"];
        _model.poemDescription = [resultSet stringForColumn: @"D_INTROSHI"];
        _model.collected = [resultSet intForColumn: @"D_COLLECT"];
        _model.poemComment = [resultSet stringForColumn:@"D_COMMENT"];
        _model.poemKindName = [resultSet stringForColumn:@"D_KIND"];
    }
    [database close];
    return _model;
}


+ (instancetype)modelWithDict:(NSDictionary *)dict {
    SIXPoetryModel *poetryModel = [SIXPoetryModel new];
    poetryModel.poemTitle = dict[@"biaoti"];
    poetryModel.poemContent = dict[@"neirong"];
    poetryModel.poemAuthor = dict[@"zuozhe"];
    poetryModel.poemDescription = dict[@"jieshao"];
    poetryModel.poemComment = @"";
    poetryModel.collected = NO;
    return poetryModel;
}

- (void)loadModelWithPoemID:(NSString *)poemID {
    NSString *url = @"http://api.avatardata.cn/TangShiSongCi/LookUp";
    NSMutableDictionary *paramenters = [NSMutableDictionary dictionary];
    paramenters[@"key"] = @"73a4a095cd96475291e6ced081f06a25";
    paramenters[@"id"] = poemID;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [manager GET:url parameters:paramenters success:^(NSURLSessionDataTask *task, id responseObject) {
            if (![responseObject[@"reason"]isEqualToString:@"Succes"]) {
                NSLog(@"输入关键字有误");
                return ;
            }
            self.model = [SIXPoetryModel modelWithDict:responseObject[@"result"]];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"诗歌下载失败%@", error);
        }];
    });
}

@end
