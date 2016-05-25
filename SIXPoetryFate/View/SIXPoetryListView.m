//
//  SIXPoetryListView.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXPoetryListView.h"

@implementation SIXPoetryListView

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64-40) style:UITableViewStylePlain];
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
