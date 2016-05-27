//
//  SIXLifeController.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXLifeModel.h"
#import "SIXLifeView.h"

@interface SIXLifeController : UIViewController

@property (nonatomic, strong) SIXLifeModel *myModel;
@property (nonatomic, weak) SIXLifeView *myView;

@end
