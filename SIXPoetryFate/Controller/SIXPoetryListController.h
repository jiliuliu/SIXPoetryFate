//
//  SIXPoetryListController.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXPoetryListModel.h"
#import "SIXPoetryListView.h"

@interface SIXPoetryListController : UIViewController

@property (nonatomic, strong) SIXPoetryListModel *myModel;
@property (nonatomic, weak) SIXPoetryListView *myView;

@end
