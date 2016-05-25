//
//  SIXFontView.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXFontView.h"

@implementation SIXFontView

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
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
