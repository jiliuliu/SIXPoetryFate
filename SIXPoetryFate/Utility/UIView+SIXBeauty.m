//
//  UIView+SIXBeauty.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/20.
//  Copyright © 2016年 six. All rights reserved.
//

#import "UIView+SIXBeauty.h"

@implementation UIView (SIXBeauty)

- (void)becomeCircular {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width*0.5;
//    self.layer.borderWidth = 2;
//    self.layer.borderColor = [UIColor greenColor].CGColor;

}

- (void)becomeRoundRectangle {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
}

@end
