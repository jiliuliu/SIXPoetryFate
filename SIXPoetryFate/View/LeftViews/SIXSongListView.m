//
//  SIXSongListView.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSongListView.h"

@implementation SIXSongListView



- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, WIDTH, HEIGHT-40-40) style:UITableViewStylePlain];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
        tableView.backgroundColor = [UIColor clearColor];
        [self addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
