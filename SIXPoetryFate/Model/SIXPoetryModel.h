//
//  SIXPoetryModel.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIXPoetryModel : NSObject

/** 诗的内容 */
@property (strong, nonatomic) NSString *poemContent;
/** 诗注解 */
@property (strong, nonatomic) NSString *poemDescription;
/** 诗作者 */
@property (strong, nonatomic) NSString *poemAuthor;
/** 诗的标题 */
@property (strong, nonatomic) NSString *poemTitle;
/** 是否被收藏 */
@property (assign, nonatomic) BOOL collected;
/** 评论 */
@property (strong, nonatomic) NSString *poemComment;
/** 诗歌分类 */
@property (strong, nonatomic) NSString *poemKindName;
/** ID */
@property (strong, nonatomic) NSString *poemID;


/** 取出数据库里诗的集合 */
@property (strong, nonatomic) SIXPoetryModel *model;

- (SIXPoetryModel *)loadModelWithPoemTitle:(NSString *)poemTitle;

- (void)loadModelWithPoemID:(NSString *)poemID;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
//
//+ (void)receiveSearchPoetryDataWithPoemID:(NSString *)poemID andBlock:(void(^)(SIXPoetryModel *poetryModel))block;

@end
