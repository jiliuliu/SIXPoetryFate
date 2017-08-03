//
//  SIXWordColorView.h
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXBaseView.h"

@interface SIXWordColorView : SIXBaseView

@property (nonatomic, weak) UISlider *redSlider;
@property (nonatomic, weak) UISlider *blueSlider;
@property (nonatomic, weak) UISlider *greenSlider;
@property (nonatomic, weak) UISlider *alphaSlider;

@property (nonatomic, weak) UIView *colorPalette;

@end
