//
//  UIColor+SIXWordColor.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/25.
//  Copyright © 2016年 six. All rights reserved.
//

#import "UIColor+SIXWordColor.h"

@implementation UIColor (SIXWordColor)

+ (instancetype)colorOfWordColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *wordColor = [defaults objectForKey:@"wordColor"];
    if (wordColor) {
        return [UIColor colorWithRed:[wordColor[@"red"] floatValue] green:[wordColor[@"green"] floatValue] blue:[wordColor[@"blue"] floatValue] alpha:[wordColor[@"alpha"] floatValue]];
    }
    return [UIColor blackColor];
}


@end
