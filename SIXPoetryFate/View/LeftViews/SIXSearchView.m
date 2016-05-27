//
//  SIXSearchView.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSearchView.h"

@implementation SIXSearchView

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 54, WIDTH, 50)];
        searchBar.placeholder = @"请输入诗名、作者、诗句";
        searchBar.searchBarStyle = UISearchBarStyleMinimal;
        [self addSubview:searchBar];
        _searchBar = searchBar;
    }
    return _searchBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, WIDTH, HEIGHT-104)];
        tableView.backgroundColor = [UIColor clearColor];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
        [self addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityIndicatorView.center = self.center;
        [self addSubview:activityIndicatorView];
        _activityIndicatorView = activityIndicatorView;
    }
    return _activityIndicatorView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
