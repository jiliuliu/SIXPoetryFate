//
//  SIXForumController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXForumController.h"

static  NSString *tiebaKey = @"http://bbs.guqu.net";

@interface SIXForumController ()

@end

@implementation SIXForumController

- (void)loadView {
    self.view = [[SIXForumView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXForumView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.myView.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:tiebaKey]]];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
