//
//  SettingViewController.h
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray* _settingNameArray;
    UIView* _cellSelectionView;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
