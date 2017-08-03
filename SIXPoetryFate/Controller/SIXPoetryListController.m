//
//  SIXPoetryListController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXPoetryListController.h"
#import "SIXPoetryController.h"

@interface SIXPoetryListController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SIXPoetryListController

- (void)loadView {
    self.view = [[SIXPoetryListView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXPoetryListView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self configMyView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.myView.bgImageView.image = [UIImage imageNamed:BACKGROUDIMAGENAME];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.view = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SIXPoetryListModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXPoetryListModel new];
    }
    return _myModel;
}

- (void)configMyView {
    self.myView.tableView.delegate = self;
    self.myView.tableView.dataSource = self;
    
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAction)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.myView addGestureRecognizer:gesture];
}
- (void)swipeGestureAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myModel.models.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TableViewCell"];
    }
    cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:20] : [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor colorOfWordColor];
    cell.textLabel.text = self.myModel.models[indexPath.row].poemTitle;
    cell.detailTextLabel.text = self.myModel.models[indexPath.row].poemAuthor;
    cell.detailTextLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:16] : [UIFont systemFontOfSize:16];
    cell.detailTextLabel.textColor = [UIColor colorOfWordColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SIXPoetryController *poetryC = [[SIXPoetryController alloc] init];
    poetryC.myModel = [poetryC.myModel loadModelWithPoemTitle:self.myModel.models[indexPath.row].poemTitle];
    [self.navigationController pushViewController:poetryC animated:YES];
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
