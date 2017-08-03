//
//  FMDBManager.h
//  SIXPoetryFate
//
//  Created by tarena on 16/5/18.
//  Copyright © 2016年 six. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@class SIXPoetryModel;

@interface FMDBManager : NSObject

+ (FMDatabase *)sharedDatabase;

+ (void)collectPoetry:(SIXPoetryModel *)poetry;

+ (void)savePoetryComment:(SIXPoetryModel *)poetry;

+ (void)selectPoetryWithKeyword:(NSString *)keyword withBlock:(void(^)(NSArray *models))block;

@end
