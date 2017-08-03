//
//  SIXFontModel.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/25.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXFontModel.h"

@implementation SIXFontModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *mutArr = [NSMutableArray array];
        [mutArr addObjectsFromArray:[UIFont fontNamesForFamilyName:@"Heiti SC"]];
        [mutArr addObjectsFromArray:[UIFont fontNamesForFamilyName:@"Heiti TC"]];
        [mutArr addObjectsFromArray:[UIFont fontNamesForFamilyName:@"Hiragino Kaku Gothic ProN"]];
        [mutArr addObjectsFromArray:[UIFont fontNamesForFamilyName:@"Hiragino Mincho ProN"]];
        _datas = mutArr.copy;
    }
    return self;
}

@end
