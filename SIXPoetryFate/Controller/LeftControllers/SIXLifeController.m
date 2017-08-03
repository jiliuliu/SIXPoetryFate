//
//  SIXLifeController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXLifeController.h"
#import "UIViewController+SIXGesture.h"


@interface SIXLifeController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@end

@implementation SIXLifeController

- (void)loadView {
    self.view = [[SIXLifeView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXLifeView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self configMyView];
    [self addSwipeGestureToPopController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.myView.bgImageView.image = [UIImage imageNamed:[[NSUserDefaults standardUserDefaults] objectForKey:@"poetry背景图片"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SIXLifeModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXLifeModel new];
    }
    return _myModel;
}

- (void)configMyView {
    self.myView.tableView.dataSource = self;
    self.myView.tableView.delegate = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 50;
    }
    if (indexPath.row == 1) {
        return 320;
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.myView.activityIndicatorView.isAnimating) {
        [self.myView.activityIndicatorView stopAnimating];
    }
    
    if (indexPath.row == 0) {
        SIXLifeViewSearchCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {
            cell = [SIXLifeViewSearchCell new];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.searchBar.delegate = self;
            cell.searchBar.inputAccessoryView = [self addSIXToolbar];
//            [cell.searchBar becomeFirstResponder];
        }
        return cell;
    }
    
    if (!self.myModel.author) return [UITableViewCell new];
    
    if (indexPath.row == 1) {
        SIXLifeViewPoetHeadCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {
            cell = [SIXLifeViewPoetHeadCell new];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        @synchronized(self) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.myModel.imageUrl]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.poetHead.image = [UIImage imageWithData:data];
                });
            });
        }
        return cell;
    }
    
    SIXLifeViewIntroductionCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [SIXLifeViewIntroductionCell new];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor colorOfWordColor];
        [cell.textLabel sizeToFit];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:16] : [UIFont systemFontOfSize:16];
    }
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self.myModel.introduction];
    //调整label显示的行间隔
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    [paraStyle setLineSpacing:15];
    [attributeStr addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, self.myModel.introduction.length)];
    cell.textLabel.attributedText = attributeStr;
    cell.textLabel.text = self.myModel.introduction;
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (searchBar.text == 0) {
        return;
    }
    [self.myView.activityIndicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.myModel = [self.myModel loadModelWithKeyword:searchBar.text];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myView.tableView reloadData];
        });
    });
}

- (void)closeKeyboard {
    [self.view endEditing:YES];
    
    UISearchBar *searchBar = [self.myView.tableView viewWithTag:searchBarTag];
    self.myModel = [self.myModel loadModelWithKeyword:searchBar.text];
    [self.myView.tableView reloadData];
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
