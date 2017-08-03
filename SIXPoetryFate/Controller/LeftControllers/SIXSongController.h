//
//  SIXSongController.h
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXSongView.h"
#import "SIXSongModel.h"

@interface SIXSongController : UIViewController

@property (nonatomic, weak) SIXSongView *myView;
@property (nonatomic, strong) SIXSongModel *myModel;

@end
