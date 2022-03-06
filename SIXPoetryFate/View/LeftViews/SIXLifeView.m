//
//  SIXLifeView.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/27.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXLifeView.h"

@implementation SIXLifeView

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview: tableView];
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

@end

@implementation SIXLifeViewSearchCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
        searchBar.placeholder = @"请输入诗人姓名";
        searchBar.searchBarStyle = UISearchBarStyleMinimal;
        searchBar.tag = searchBarTag;
        [self.contentView addSubview:searchBar];
        _searchBar = searchBar;
    }
    return self;
}

@end

@implementation SIXLifeViewPoetHeadCell


- (UIImageView *)poetHead {
    if (!_poetHead) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH-200)/2, 10, 200, 300)];
        [self.contentView addSubview:imageView];
        _poetHead = imageView;
    }
    return _poetHead;
}


@end

@implementation SIXLifeViewIntroductionCell


@end
