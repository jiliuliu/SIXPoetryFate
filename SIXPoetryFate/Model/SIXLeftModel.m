//
//  SIXLeftModel.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXLeftModel.h"

@implementation SIXLeftModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _datas = @[@"诗词搜索", @"本地查找", @"诗意人生", @"歌曲欣赏", @"进入论坛", @"应用风格"];
    }
    return self;
}

@end
