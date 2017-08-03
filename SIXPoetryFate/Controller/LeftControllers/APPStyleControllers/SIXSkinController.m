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
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"设置" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *leftAction = [UIAlertAction actionWithTitle:@"阅读页背景" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.myModel.datas[indexPath.row] forKey:@"poetry背景图片"];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *rightAction = [UIAlertAction actionWithTitle:@"应用背景" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.myModel.datas[indexPath.row] forKey:@"app背景图片"];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    
    [alertC addAction:leftAction];
    [alertC addAction:rightAction];
    [alertC addAction:cancleAction];
    
    [self presentViewController:alertC animated:YES completion:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-20)/3;
    return CGSizeMake(width, width*HEIGHT/WIDTH);
}


@end
