//
//  SIXSongListModel.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSongListModel.h"

@implementation SIXSongListModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _datas = @[@"诗经·郑风·子衿", @"战国七雄", @"渔歌子"];
    }
    return self;
}

@end
