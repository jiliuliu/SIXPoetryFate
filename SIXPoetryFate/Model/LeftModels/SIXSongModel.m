//
//  SIXSongModel.m
//  SIXPoetryFate
//
//  Created by liu on 16/5/28.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXSongModel.h"

@implementation SIXSongModel

- (NSArray *)models {
    if (!_models) {
        SIXSongModel *model1 = [SIXSongModel new];
        model1.songLyric = @"诗经·郑风·子衿\n\n古琴弹唱：杨芬\n\n\n  青青子衿，悠悠我心。纵我不往，子宁不嗣音？\n\n  青青子佩，悠悠我思。纵我不往，子宁不来？\n\n  挑兮达兮，在城阙兮。一日不见，如三月兮。";
        model1.songUrl = @"http://music8.guqu.net/guqumusic/mengmeng/guqin//066zj.mp3";
        
        SIXSongModel *model2 = [SIXSongModel new];
        model2.songLyric = @"作词：徐丁尧\n\n作曲：余恒峰\n\n演唱：极泷\n\n\n  风卷狂杀，兵临城下。气贯长虹，金戈铁马。韶华易逝，落尽多少残花，且问苍生，谁能一统天下。血染万里黄沙，今朝谁家天下？醉看几度落霞，泪洒谁家铠甲。王于兴师，厉兵秣马。与子偕行，修我兵甲。啊……与子同仇，啊……且为谁家？\n\n  风卷狂沙，兵临城下。气贯长虹，金戈铁马。韶华易逝，落尽多少残花，且问苍生，谁能一统天下。血染万里黄沙，今朝谁家天下？醉看几度落霞，泪洒谁家铠甲。弑君谋国，图雄争霸。万姓流离，望断天涯。啊……兆黎皆苦，啊……何处为家？\n\n  风卷狂沙，兵临城下。气贯长虹，金戈铁马。韶华易逝，落尽多少残花，且问苍生，谁能一统天下。";
        model2.songUrl = @"http://music8.guqu.net/guqumusic/mengmeng/yingshi//161zgqx.mp3";
        
        SIXSongModel *model3 = [SIXSongModel new];
        model3.songLyric = @"作词：渔歌子\n\n作者：张志和\n\n古琴弹唱：杨芬\n\n\n  西塞山前白鹭飞，桃花流水鳜鱼肥。\n\n  青箬笠，绿蓑衣，斜风细雨不须归。";
        model3.songUrl = @"http://music8.guqu.net/guqumusic/mengmeng/guqin//113ygz.mp3";
        
        _models = @[model1, model2, model3];
    }
    return _models;
}

@end
