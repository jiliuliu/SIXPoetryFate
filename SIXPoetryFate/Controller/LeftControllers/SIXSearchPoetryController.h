//
//  SIXSearchPoetryController.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXSearchView.h"
#import "SIXSearchModel.h"

@interface SIXSearchPoetryController : UIViewController

@property (nonatomic, strong) SIXSearchModel *myModel;
@property (nonatomic, weak) SIXSearchView *myView;

@end
