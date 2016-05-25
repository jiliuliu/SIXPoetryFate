//
//  SIXSearchModel.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSearchModel.h"
#import "AFNetworking.h"
#import "FMDBManager.h"

@implementation SIXSearchModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    SIXSearchModel *model = [SIXSearchModel new];
    model.poemID = dict[@"id"];
    model.poemTitle = dict[@"name"];
    return model;
}

- (void)loadModelsWithKeyword:(NSString *)keyword withBlock:(void (^)(void))block {
    NSString *url = @"http://api.avatardata.cn/TangShiSongCi/Search";
    NSMutableDictionary *paramenters = [NSMutableDictionary dictionary];
    paramenters[@"key"] = @"73a4a095cd96475291e6ced081f06a25";
    paramenters[@"keyWord"] = keyword;
    NSMutableArray *mutArr = [NSMutableArray array];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [manager GET:url parameters:paramenters success:^(NSURLSessionDataTask *task, id responseObject) {
            if (![responseObject[@"reason"] isEqualToString:@"Succes"]) {
                NSLog(@"输入有误");
                return ;
            }
            NSArray *arr = responseObject[@"result"];
            for (NSDictionary *dict in arr) {
                SIXSearchModel *model = [SIXSearchModel modelWithDict:dict];
                [mutArr addObject:model];
            }
            _models = mutArr.copy;
            block();
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"诗歌搜索失败：%@", error);
        }];
    });
}

- (void)loadLocalModelsWithKeyword:(NSString *)keyword withBlock:(void (^)(void))block {
    NSMutableArray *mutArr = [NSMutableArray array];
    [FMDBManager selectPoetryWithKeyword:keyword withBlock:^(NSArray *models) {
        for (NSString *str in models) {
            SIXSearchModel *model = [SIXSearchModel new];
            model.poemTitle = str;
            [mutArr addObject:model];
        }
        _models = mutArr.copy;
        block();
    }];
}

@end
