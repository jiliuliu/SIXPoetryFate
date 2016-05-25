//
//  SIXMainModel.h
//  SIXPoetryFate
//
//  Created by tarena on 16/5/18.
//  Copyright © 2016年 six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIXMainModel : NSObject

#pragma mark - 诗类别模型
@property (strong, nonatomic) NSString *kindName;

@property (strong, nonatomic) NSArray<SIXMainModel *> *models;

@end
