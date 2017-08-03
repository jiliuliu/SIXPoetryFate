//
//  SIXLeftController.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXLeftModel.h"
#import "SIXLeftView.h"

@interface SIXLeftController : UIViewController

@property (nonatomic, weak) SIXLeftView *myView;
@property (nonatomic, strong) SIXLeftModel *myModel;

@end
