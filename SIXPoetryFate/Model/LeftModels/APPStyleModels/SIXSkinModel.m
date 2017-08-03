//
//  SIXSkinModel.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSkinModel.h"

@implementation SIXSkinModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *mutArr = [NSMutableArray array];
        for (int i=0; i<22; i++) {
            [mutArr addObject:[NSString stringWithFormat:@"bg%d", i]];
        }
        _datas = mutArr.copy;
    }
    return self;
}

@end
