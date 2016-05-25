//
//  UIViewController+SIXGesture.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "UIViewController+SIXGesture.h"

@implementation UIViewController (SIXGesture)

- (void)addSwipeGestureToPopController {
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAction)];
    gesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:gesture];
}

- (void)swipeGestureAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
