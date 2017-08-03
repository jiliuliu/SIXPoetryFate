//
//  SIXSIXSongListController.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSongListController.h"
#import "SIXSongController.h"
#import "UIViewController+SIXGesture.h"

@interface SIXSongListController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SIXSongListController

- (void)loadView {
    self.view = [[SIXSongListView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXSongListView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self configMyView];
    [self addSwipeGestureToPopController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.myView.bgImageView.image = [UIImage imageNamed:BACKGROUDIMAGENAME];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SIXSongListModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXSongListModel new];
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SIXSongController *songView = [SIXSongController new];
    songView.myModel = songView.myModel.models[indexPath.row];
    [self.navigationController pushViewController:songView animated:YES];
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
