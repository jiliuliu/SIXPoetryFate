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


- (UIToolbar *)addSIXToolbar {
    UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(closeKeyboard)];
    [topView setItems:@[spaceItem, doneItem] animated:YES];
    return topView;
}
- (void)closeKeyboard {
    [self.view endEditing:YES];
}

@end
