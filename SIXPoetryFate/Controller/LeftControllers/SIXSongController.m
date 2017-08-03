//
//  SIXSongController.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSongController.h"
#import "UIViewController+SIXGesture.h"
#import <AVFoundation/AVFoundation.h>

@interface SIXSongController ()

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation SIXSongController

- (void)loadView {
    self.view = [[SIXSongView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.myView = (SIXSongView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configMyView];
    [self addSwipeGestureToPopController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.myView.bgImageView.image = [UIImage imageNamed:BACKGROUDIMAGENAME];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.player play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SIXSongModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXSongModel new];
    }
    return _myModel;
}

- (AVAudioPlayer *)player {
    if (!_player) {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.myModel.songUrl]];
        _player = [[AVAudioPlayer alloc] initWithData:data error:nil];
    }
    return _player;
}

- (void)configMyView {
    self.myView.lyricLabel.text = self.myModel.songLyric;
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
