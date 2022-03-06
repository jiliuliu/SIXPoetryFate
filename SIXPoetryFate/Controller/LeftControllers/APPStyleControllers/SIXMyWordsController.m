//
//  SIXMyWordsController.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXMyWordsController.h"
#import "UIViewController+SIXGesture.h"

@interface SIXMyWordsController ()

@end

@implementation SIXMyWordsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"你侬我侬";
    self.view.backgroundColor = UIColor.whiteColor;
    [self addSwipeGestureToPopController];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 30, WIDTH-16, HEIGHT-200)];
    label.numberOfLines = 0;
//    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"你好，我可爱的用户：\n\n     我是诗缘的开发者，下面是一些我的寄语：\n     做不了多好，但一定是有灵魂的。这是我对自己作品的要求。\n     请原谅我任性的取名，各个模板的名字让人不知所措，作者是小淘气，无法正常取名。因此，对一些模块进行解析，千百度是网络搜索，寻觅觅和醉意人生是本地搜索，后面两者都要完整名称才能进行搜索。由于没有足够的资源，一曲红尘板块权当是鸡肋吧。\n     我清楚的知道这款作品目前十分粗糙，但以我目前技术水平，已算力尽了。更好的，也只能请你们等待。";
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
