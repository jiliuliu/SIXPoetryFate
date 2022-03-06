//
//  SIXLocalSearchController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXLocalSearchController.h"
#import "SIXPoetryController.h"

@interface SIXLocalSearchController ()

@end

@implementation SIXLocalSearchController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"寻觅觅";
    self.myView.searchBar.placeholder = @"请输入完整的诗名、作者";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGRect frame = self.myView.searchBar.frame;
    frame.origin.y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    self.myView.searchBar.frame = frame;
    
    frame = self.myView.tableView.frame;
    frame.origin.y = CGRectGetMaxY(self.myView.searchBar.frame);
    frame.size.height = HEIGHT - frame.origin.y;
    self.myView.tableView.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideKeyboard {
    if (self.myView.searchBar.text.length == 0) {
        return ;
    }
    [self.myView.activityIndicatorView startAnimating];
    [self.myModel loadLocalModelsWithKeyword:self.myView.searchBar.text withBlock:^{
        [self.myView.tableView reloadData];
    }];
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SIXPoetryController *poetryC = [[SIXPoetryController alloc] init];
    poetryC.myModel = [poetryC.myModel loadModelWithPoemTitle:self.myModel.models[indexPath.row].poemTitle];
    [self.navigationController pushViewController:poetryC animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
//    if (searchBar.text.length == 0) {
//        return ;
//    }
//    [self.myView.activityIndicatorView startAnimating];
//    [self.myModel loadLocalModelsWithKeyword:self.myView.searchBar.text withBlock:^{
//        [self.myView.tableView reloadData];
//    }];
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
