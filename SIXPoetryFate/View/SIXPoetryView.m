//
//  SIXPoetryView.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXPoetryView.h"

@implementation SIXPoetryView

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.contentSize = CGSizeMake(2*WIDTH, HEIGHT);
        scrollView.pagingEnabled = YES;
        [self addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 54, WIDTH, HEIGHT-54)];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.scrollView addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (UITextView *)textView {
    if (!_textView) {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(WIDTH, 54, WIDTH, HEIGHT-54)];
        
        textView.textAlignment = NSTextAlignmentLeft;
        textView.backgroundColor = [UIColor clearColor];
        
        //模仿UTextField的placeholder属性
        UILabel *placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 80, WIDTH-5*2, 100)];
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.tag = placeholderLabelTag;
        placeholderLabel.text = @"\n   轻轻一点\n\n\n          留下您，一瞬即逝的心声。。。";
        placeholderLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:20] : [UIFont systemFontOfSize:20];
        placeholderLabel.textColor = [UIColor grayColor];
        [textView addSubview:placeholderLabel];

        
        [_scrollView addSubview:textView];
        _textView = textView;
    }
    return _textView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
