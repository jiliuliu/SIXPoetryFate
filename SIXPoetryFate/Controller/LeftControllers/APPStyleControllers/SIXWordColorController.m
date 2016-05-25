//
//  SIXWordColorController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/24.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXWordColorController.h"
#import "UIViewController+SIXGesture.h"

@interface SIXWordColorController ()


@property (assign, nonatomic)float red;
@property (assign, nonatomic)float green;
@property (assign, nonatomic)float blue;
@property (assign, nonatomic)float alpha;

@end

@implementation SIXWordColorController

- (void)loadView {
    self.view = [[SIXWordColorView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXWordColorView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configMyView];
    [self addSwipeGestureToPopController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defaults objectForKey:@"wordColor"];
    self.myView.redSlider.value = [dict[@"red"] floatValue];
    self.myView.blueSlider.value = [dict[@"blue"] floatValue];
    self.myView.greenSlider.value = [dict[@"green"] floatValue];
    self.myView.alphaSlider.value = [dict[@"alpha"] floatValue];
    
    self.myView.colorPalette.backgroundColor = [UIColor colorOfWordColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSDictionary *wordColor = @{@"red":@(self.myView.redSlider.value),
                                                        @"blue":@(self.myView.blueSlider.value),
                                                        @"green":@(self.myView.greenSlider.value),
                                                        @"alpha":@(self.myView.alphaSlider.value),
                                                    };
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:wordColor forKey:@"wordColor"];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configMyView {
    self.myView.backgroundColor = [UIColor whiteColor];
    [self.myView.redSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.myView.blueSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.myView.greenSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.myView.alphaSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
}

- (void)sliderAction:(UISlider *)sender {
    self.myView.colorPalette.backgroundColor = [UIColor colorWithRed:self.myView.redSlider.value green:self.myView.greenSlider.value blue:self.myView.blueSlider.value alpha:self.myView.alphaSlider.value];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
