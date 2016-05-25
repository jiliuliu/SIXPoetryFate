//
//  SIXLeftController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXLeftController.h"
#import "SIXLeftView.h"
#import "SIXLeftModel.h"
#import "UIView+SIXBeauty.h"
#import "SIXSearchPoetryController.h"
#import "SIXLocalSearchController.h"
#import "SIXForumController.h"
#import "SIXAPPStyleController.h"

@interface SIXLeftController () <UICollectionViewDataSource, UICollectionViewDelegate>


@end

@implementation SIXLeftController

- (SIXLeftModel *)myModel {
    if (!_myModel) {
        _myModel = [[SIXLeftModel alloc] init];
    }
    return _myModel;
}

- (void)loadView {
    self.view = [[SIXLeftView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXLeftView *)self.view;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self configMyView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.myView.bgImageView.image = [UIImage imageNamed:BACKGROUDIMAGENAME];
    [self.myView.collectionView reloadData];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)configMyView {
    self.myView.collectionView.dataSource = self;
    self.myView.collectionView.delegate = self;

    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeGestureAction)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight|UISwipeGestureRecognizerDirectionLeft;
    [self.myView addGestureRecognizer:gesture];
}

- (void)SwipeGestureAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.myModel.datas.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SIXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    
    cell.myLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:25] : [UIFont systemFontOfSize:25];
    cell.myLabel.textColor = [UIColor colorOfWordColor];
    cell.myLabel.textAlignment = NSTextAlignmentCenter;
    cell.myLabel.text = self.myModel.datas[indexPath.row];
    cell.myLabel.backgroundColor = [UIColor colorWithRed:100 green:100 blue:100 alpha:0.3];
    [cell.myLabel becomeCircular];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            SIXSearchPoetryController *searchC = [SIXSearchPoetryController new];
            [self.navigationController pushViewController:searchC animated:YES];
                }
            break;
        case 1:{
            SIXLocalSearchController *localSearchC = [SIXLocalSearchController new];
            [self.navigationController pushViewController:localSearchC animated:YES];
        }
            break;
        case 2:{
            SIXSearchPoetryController *searchC = [SIXSearchPoetryController new];
            [self.navigationController pushViewController:searchC animated:YES];
        }
            break;
        case 3:{
            SIXSearchPoetryController *searchC = [SIXSearchPoetryController new];
            [self.navigationController pushViewController:searchC animated:YES];
        }
            break;
        case 4:{
            SIXForumController *forumC = [SIXForumController new];
            [self.navigationController pushViewController:forumC animated:YES];
        }
            break;
        default:{
            SIXAPPStyleController *styleC = [SIXAPPStyleController new];
            [self.navigationController pushViewController:styleC animated:YES];
        }
            break;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-30)/2;
    return CGSizeMake(width, width);
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
