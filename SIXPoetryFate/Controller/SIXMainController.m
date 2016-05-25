//
//  SIXMainController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/19.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXMainController.h"
#import "SIXLeftController.h"
#import "SIXMainView.h"
#import "SIXMainModel.h"
#import "SIXPoetryListController.h"
#import "UIView+SIXBeauty.h"


@interface SIXMainController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SIXMainController

- (SIXMainModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXMainModel new];
    }
    return _myModel;
}

- (void)loadView {
    self.view = [[SIXMainView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.myView = (SIXMainView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configMyView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.myView.collectionView reloadData];
    self.myView.bgImageView.image = [UIImage imageNamed:BACKGROUDIMAGENAME];
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
    SIXLeftController *leftC = [[SIXLeftController alloc] init];
    leftC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:leftC] animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.myModel.models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SIXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];

    cell.myLabel.text = self.myModel.models[indexPath.row].kindName;
    cell.myLabel.textAlignment = NSTextAlignmentCenter;
    cell.myLabel.textColor = [UIColor colorOfWordColor];
    cell.myLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:25] : [UIFont systemFontOfSize:25];
    cell.myLabel.backgroundColor = [UIColor colorWithRed:100 green:100 blue:100 alpha:0.3];
    [cell.myLabel becomeRoundRectangle];
    
    if (indexPath.row == self.myModel.models.count-1) {
        cell.myLabel.text = @"诗 缘";
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SIXPoetryListController *poetryC = [[SIXPoetryListController alloc] init];
    [poetryC.myModel loadModelsWithKindName:self.myModel.models[indexPath.row].kindName];
    [self.navigationController pushViewController:poetryC animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-10)/2;
    return CGSizeMake(width, width*160/340);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(100, 0, 0, 0);
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
