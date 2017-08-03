//
//  SIXPoetryView.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXBaseView.h"

static NSInteger const placeholderLabelTag = 100;

@interface SIXPoetryView : SIXBaseView

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UITextView *textView;

@end
