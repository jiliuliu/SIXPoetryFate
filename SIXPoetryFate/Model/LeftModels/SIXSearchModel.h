//
//  SIXSearchModel.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIXSearchModel : NSObject

@property (strong, nonatomic) NSString *poemID;

@property (strong, nonatomic) NSString *poemTitle;



@property (strong, nonatomic) NSArray <SIXSearchModel *> *models;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

- (void)loadModelsWithKeyword:(NSString *)keyword withBlock:(void (^)(void))block;

- (void)loadLocalModelsWithKeyword:(NSString *)keyword withBlock:(void (^)(void))block;

@end
