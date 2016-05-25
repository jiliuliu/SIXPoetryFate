//
//  SIXSkinController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSkinController.h"
#import "UIViewController+SIXGesture.h"

@interface SIXSkinController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation SIXSkinController

- (void)loadView {
    self.view = [[SIXSkinView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXSkinView *)self.view;
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

- (SIXSkinModel *)myModel{
    if (!_myModel) {
        _myModel = [SIXSkinModel new];
    }
    return _myModel;
}

- (void)configMyView {
    self.myView.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.myView.collectionView.delegate = self;
    self.myView.collectionView.dataSource =self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.myModel.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.myModel.datas[indexPath.row]]];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.myModel.datas[indexPath.row] forKey:@"app背景图片"];
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"设置成功" message:@"是否返回主页" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alertC addAction:leftAction];
    [alertC addAction:rightAction];
    
    [self presentViewController:alertC animated:YES completion:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-20)/3;
    return CGSizeMake(width, width*HEIGHT/WIDTH);
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
