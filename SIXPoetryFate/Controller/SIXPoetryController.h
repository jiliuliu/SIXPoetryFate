//
//  SIXPoetryController.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIXPoetryModel.h"
#import "SIXPoetryView.h"

@interface SIXPoetryController : UIViewController

enum SourceModel{
    LOCALDATAMODEL, NETDATAMODEL
};

@property (nonatomic, strong) SIXPoetryModel *myModel;
@property (nonatomic, weak) SIXPoetryView *myView;

@property (nonatomic, assign) enum SourceModel soureModel;


- (instancetype)initWithSourModel:(enum SourceModel)soureModel;

@end
