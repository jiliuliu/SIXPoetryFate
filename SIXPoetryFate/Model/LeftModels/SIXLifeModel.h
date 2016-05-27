//
//  SIXLifeModel.h
//  SIXPoetryFate
//
//  Created by liu on 16/5/27.
//  Copyright © 2016年 six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIXLifeModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *introduction;


@property (nonatomic, strong) SIXLifeModel *model;

- (instancetype)loadModelWithKeyword:(NSString *)keyword;

@end
