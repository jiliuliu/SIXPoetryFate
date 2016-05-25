//
//  SIXCollectionViewCell.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/25.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXCollectionViewCell.h"

@implementation SIXCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:label];
        _myLabel = label;
    }
    return self;
}

@end
