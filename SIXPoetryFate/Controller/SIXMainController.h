//
//  SIXMainController.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/19.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXMainModel.h"
#import "SIXMainView.h"

@interface SIXMainController : UIViewController

@property(nonatomic, strong) SIXMainModel *myModel;

@property(nonatomic, weak)  SIXMainView *myView;

@end
