//
//  SIXLifeView.h
//  SIXPoetryFate
//
//  Created by liu on 16/5/27.
//  Copyright © 2016年 six. All rights reserved.
//

#import "SIXBaseView.h"


static NSInteger const searchBarTag = 111;

@interface SIXLifeView : SIXBaseView

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIActivityIndicatorView *activityIndicatorView;

@end

@interface SIXLifeViewSearchCell : UITableViewCell

@property (nonatomic, weak) UISearchBar *searchBar;

@end


@interface SIXLifeViewPoetHeadCell : UITableViewCell

@property (nonatomic, weak) UIImageView *poetHead;


@end

@interface SIXLifeViewIntroductionCell : UITableViewCell


@end
