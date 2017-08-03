//
//  SIXSongView.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSongView.h"

@implementation SIXSongView


- (UILabel *)lyricLabel {
    if (!_lyricLabel) {
        UILabel *lyricLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, WIDTH-16, HEIGHT)];
        lyricLabel.numberOfLines = 0;
        lyricLabel.textAlignment = NSTextAlignmentCenter;
        lyricLabel.textColor = [UIColor colorOfWordColor];
        lyricLabel.font = MYFONT ?  [UIFont fontWithName:MYFONT size:18] : [UIFont systemFontOfSize:18];
        [self addSubview:lyricLabel];
        _lyricLabel = lyricLabel;
    }
    return _lyricLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
