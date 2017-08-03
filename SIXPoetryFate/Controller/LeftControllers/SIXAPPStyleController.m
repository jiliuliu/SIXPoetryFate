//
//  SIXAPPStyleController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXAPPStyleController.h"
#import "UIViewController+SIXGesture.h"
#import "SIXSkinController.h"
#import "SIXFontController.h"
#import "SIXWordColorController.h"
#import "SIXMyWordsController.h"

@interface SIXAPPStyleController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SIXAPPStyleController

- (void)loadView {
    self.view = [[SIXAPPStyleView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXAPPStyleView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configMyView];
    [self addSwipeGestureToPopController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.myView.tableView reloadData];
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

- (void)configMyView {
    self.myView.tableView.delegate = self;
    self.myView.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:30] : [UIFont systemFontOfSize:30];
    cell.textLabel.textColor = [UIColor colorOfWordColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"罗裳";
            break;
        case 1:
            cell.textLabel.text = @"倩影";
            break;
        case 2:
            cell.textLabel.text = @"魅丽";
            break;
        default:
            cell.textLabel.text = @"你侬我侬";
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            SIXSkinController *skinC = [SIXSkinController new];
            [self.navigationController pushViewController:skinC animated:YES];
        }
            break;
        case 1:{
            SIXFontController *fontC = [SIXFontController new];
            [self.navigationController pushViewController:fontC animated:YES];
        }
            break;
        case 2:{
            SIXWordColorController *wordColorC = [SIXWordColorController new];
            [self.navigationController pushViewController:wordColorC animated:YES];
        }
            break;
        default:{
            SIXMyWordsController *myWordsC = [SIXMyWordsController new];
            [self.navigationController pushViewController:myWordsC animated:YES];
        }
            break;
    }
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
