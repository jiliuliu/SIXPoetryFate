//
//  SIXPoetryListModel.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIXPoetryListModel : NSObject

/** 诗作者 */
@property (strong, nonatomic) NSString *poemAuthor;

/** 诗的标题 */
@property (strong, nonatomic) NSString *poemTitle;


/** 取出数据库里诗的集合 */
@property (strong, nonatomic) NSArray <SIXPoetryListModel *> *models;

- (NSArray<SIXPoetryListModel *> *)loadModelsWithKindName:(NSString *)kindName;


@end
