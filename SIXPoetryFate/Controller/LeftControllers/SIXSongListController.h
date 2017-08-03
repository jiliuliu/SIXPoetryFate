//
//  SIXSIXSongListController.h
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXSongListView.h"
#import "SIXSongListModel.h"

@interface SIXSongListController : UIViewController

@property (nonatomic, weak) SIXSongListView *myView;
@property (nonatomic, strong) SIXSongListModel *myModel;

@end
