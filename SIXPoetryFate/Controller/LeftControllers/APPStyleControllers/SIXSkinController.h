//
//  SIXSkinController.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXSkinModel.h"
#import "SIXSkinView.h"

@interface SIXSkinController : UIViewController

@property (nonatomic, strong) SIXSkinModel *myModel;
@property (nonatomic, weak) SIXSkinView *myView;

@end
