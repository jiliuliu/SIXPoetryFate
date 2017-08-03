//
//  SIXWordColorView.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXWordColorView.h"
#import "UIView+SIXBeauty.h"

@implementation SIXWordColorView

- (UISlider *)redSlider {
    if (!_redSlider) {
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 100, WIDTH-100, 30)];
        slider.minimumTrackTintColor = [UIColor redColor];
        slider.thumbTintColor = [UIColor redColor];
        [self addSubview:slider];
        _redSlider = slider;
    }
    return  _redSlider;
}

- (UISlider *)blueSlider {
    if (!_blueSlider) {
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 150, WIDTH-100, 30)];
        slider.minimumTrackTintColor = [UIColor blueColor];
        slider.thumbTintColor = [UIColor blueColor];
        [self addSubview:slider];
        _blueSlider = slider;
    }
    return _blueSlider;
}

- (UISlider *)greenSlider {
    if (!_greenSlider) {
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 200, WIDTH-100, 30)];
        slider.minimumTrackTintColor = [UIColor greenColor];
        slider.thumbTintColor = [UIColor greenColor];
        [self addSubview:slider];
        _greenSlider = slider;
    }
    return _greenSlider;
}

- (UISlider *)alphaSlider {
    if (!_alphaSlider) {
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, WIDTH-100, 30)];
        slider.minimumTrackTintColor = [UIColor blackColor];
        slider.thumbTintColor = [UIColor blackColor];
        slider.minimumValue = 0.3;
        [self addSubview:slider];
        _alphaSlider = slider;
    }
    return _alphaSlider;
}

- (UIView *)colorPalette {
    if (!_colorPalette) {
        UIView *colorPalette = [[UIView alloc] initWithFrame:CGRectMake(70, 350, WIDTH-140, WIDTH-140)];
        [colorPalette becomeCircular];
        [self addSubview:colorPalette];
        _colorPalette = colorPalette;
    }
    return _colorPalette;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
