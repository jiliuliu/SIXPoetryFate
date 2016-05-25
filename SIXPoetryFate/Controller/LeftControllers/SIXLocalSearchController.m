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

    self.myView.searchBar.placeholder = @"请输入完整的诗名、作者";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideKeyboard {
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
    [self.myModel loadLocalModelsWithKeyword:self.myView.searchBar.text withBlock:^{
        [self.myView.tableView reloadData];
    }];
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
