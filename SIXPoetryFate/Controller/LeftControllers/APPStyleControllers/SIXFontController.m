//
//  SIXFontViewController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXFontController.h"
#import "UIViewController+SIXGesture.h"

@interface SIXFontController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SIXFontController

- (void)loadView {
    self.view = [[SIXFontView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXFontView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configMyView];
    [self addSwipeGestureToPopController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SIXFontModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXFontModel new];
    }
    return _myModel;
}

- (void)configMyView {
    self.myView.tableView.delegate = self;
    self.myView.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.textLabel.text = self.myModel.datas[indexPath.row];
    cell.textLabel.textColor = [UIColor colorOfWordColor];
    cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:18] : [UIFont systemFontOfSize:18];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.myModel.datas[indexPath.row] forKey:@"字体"];    
    
    [tableView reloadData];
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
