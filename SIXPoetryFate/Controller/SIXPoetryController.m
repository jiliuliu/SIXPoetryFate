//
//  SIXPoetryController.m
//  SIXPoetryFate
//
//  Created by 六 on 16/5/23.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXPoetryController.h"
#import "FMDBManager.h"

@interface SIXPoetryController () <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, UIScrollViewDelegate>

@end


@implementation SIXPoetryController

- (instancetype)initWithSourModel:(enum SourceModel)soureModel
{
    self = [super init];
    if (self) {
        _soureModel = soureModel;
    }
    return self;
}

- (void)loadView {
    self.view = [[SIXPoetryView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myView = (SIXPoetryView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configMyView];

    //添加对模型层的监听
    if (_soureModel == NETDATAMODEL) {
        [self addObserver:self forKeyPath:@"myModel.model" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.myView.bgImageView.image = [UIImage imageNamed:BACKGROUDIMAGENAME];

    //添加键盘开启  关闭的 观察
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    
    //评论
    self.myView.textView.text = self.myModel.poemComment;
    //模仿UTextField的placeholder属性
    if (self.myView.textView.text.length == 0) {
        [self.myView.textView viewWithTag:placeholderLabelTag].hidden = NO;
    }else{
        [self.myView.textView viewWithTag:placeholderLabelTag].hidden = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SIXPoetryModel *)myModel {
    if (!_myModel) {
        _myModel = [SIXPoetryModel new];
    }
    return _myModel;
}

- (void)configMyView {
    self.myView.tableView.delegate = self;
    self.myView.tableView.dataSource = self;
    self.myView.textView.delegate = self;
    self.myView.scrollView.delegate = self;
    
    self.myView.textView.textColor = [UIColor colorOfWordColor];
    self.myView.textView.font = MYFONT ? [UIFont fontWithName:MYFONT size:20] : [UIFont systemFontOfSize:20];
    
    UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:topView.bounds];
    imageView.image = [UIImage imageNamed:@"向下"];
    [topView addSubview:imageView];
    self.myView.textView.inputAccessoryView = topView;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [topView addGestureRecognizer:tapGesture];
}
- (void)closeKeyboard {
    [self.myView.textView resignFirstResponder];
}

#pragma mark - 键盘监听事件
- (void)openKeyboard:(NSNotification *)notification {
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardFrame.size.height;
    UIViewAnimationOptions options = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        self.myView.textView.frame = CGRectMake(WIDTH, 64, WIDTH, HEIGHT-keyboardHeight-64);
    } completion:nil];
}
- (void)closeKeyboard:(NSNotification *)notification {
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions options = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        self.myView.textView.frame = CGRectMake(WIDTH, 64, WIDTH, HEIGHT-64);
    } completion:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"myModel.model"]) {
        [self removeObserver:self forKeyPath:@"myModel.model"];
        self.myModel = self.myModel.model;
        [self.myView.tableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.textColor = [UIColor colorOfWordColor];
        cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:18] : [UIFont systemFontOfSize:18];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (!self.myModel.poemTitle) return cell;
    cell.accessoryView = nil;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = self.myModel.poemTitle;
        cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:20] : [UIFont systemFontOfSize:20];
        
        //添加收藏按钮
        UIButton *collectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [collectBtn setTitle:@"❀" forState:UIControlStateNormal];
        collectBtn.titleLabel.font = [UIFont systemFontOfSize:25];
        [collectBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [collectBtn addTarget:self action:@selector(collectPoetry:) forControlEvents:UIControlEventTouchUpInside];
        collectBtn.selected = self.myModel.collected;
        cell.accessoryView = collectBtn;
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"作者：%@", self.myModel.poemAuthor];
        cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:18] : [UIFont systemFontOfSize:18];
    }
    
    //诗内容
    if (indexPath.row == 2) {
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self.myModel.poemContent];
        
        //调整label显示的行间隔
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setLineSpacing:15];
        [attributeStr addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, self.myModel.poemContent.length)];
        
        cell.textLabel.attributedText = attributeStr;
        [cell.textLabel sizeToFit];
        cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:18] : [UIFont systemFontOfSize:18];
        cell.textLabel.text = self.myModel.poemContent;
    }
    
    //注解
    if (indexPath.row == 3) {
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self.myModel.poemDescription];
        
        //调整label显示的行间隔
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setLineSpacing:15];
        [attributeStr addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, self.myModel.poemDescription.length)];
        
        cell.textLabel.attributedText = attributeStr;
        [cell.textLabel sizeToFit];
        
        cell.textLabel.text = self.myModel.poemDescription;
        cell.textLabel.font = MYFONT ? [UIFont fontWithName:MYFONT size:16] : [UIFont systemFontOfSize:16];
    }
    
    return cell;
}

/** 收藏按钮的点击事件 */
- (void)collectPoetry:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.myModel.collected = sender.selected;
    
    [FMDBManager collectPoetry:self.myModel];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.myView.scrollView.contentOffset.x < -30) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"将要开始编辑？");
    [self.myView.textView viewWithTag:100].hidden = YES;
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"结束编辑。");
    //模仿UTextField的placeholder属性
    if (self.myView.textView.text.length == 0) {
        [self.myView.textView viewWithTag:100].hidden = NO;
    }else{
        [self.myView.textView viewWithTag:100].hidden = YES;
    }
    
    //保存评论
    if ([self.myModel.poemComment isEqualToString:textView.text]) {
        return;
    }
    self.myModel.poemComment = textView.text;
    [FMDBManager savePoetryComment:self.myModel];
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
