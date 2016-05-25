//
//  SIXSearchPoetryController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSearchPoetryController.h"
#import "SIXPoetryController.h"


@interface SIXSearchPoetryController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@end



@implementation SIXSearchPoetryController

- (void)loadView {
    self.view = [[SIXSearchView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXSearchView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configMyView];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SIXSearchModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXSearchModel new];
    }
    return _myModel;
}

- (void)configMyView {
    self.myView.tableView.delegate = self;
    self.myView.tableView.dataSource = self;
    self.myView.searchBar.delegate = self;
    
    UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:topView.bounds];
    imageView.image = [UIImage imageNamed:@"向下"];
    [topView addSubview:imageView];
    self.myView.searchBar.inputAccessoryView = topView;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [topView addGestureRecognizer:tapGesture];
    
    [self.myView.searchBar becomeFirstResponder];
    
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeGestureAction)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.myView addGestureRecognizer:gesture];
}
- (void)closeKeyboard {
    [self.myView.searchBar resignFirstResponder];
}
- (void)SwipeGestureAction {
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
    cell.textLabel.text = self.myModel.models[indexPath.row].poemTitle;
    cell.textLabel.textColor = [UIColor colorOfWordColor];
    cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:18] : [UIFont systemFontOfSize:18];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SIXPoetryController *poetryC = [[SIXPoetryController alloc] initWithSourModel:NETDATAMODEL];
    [poetryC.myModel loadModelWithPoemID:self.myModel.models[indexPath.row].poemID ];
    [self.navigationController pushViewController:poetryC animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.myModel loadModelsWithKeyword:searchText withBlock:^{
        [self.myView.tableView reloadData];
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
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
