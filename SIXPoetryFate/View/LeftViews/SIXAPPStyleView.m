//
//  SIXAPPStyleView.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXAPPStyleView.h"

@implementation SIXAPPStyleView

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, WIDTH, HEIGHT-300) style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
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
