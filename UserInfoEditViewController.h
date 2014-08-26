//
//  UserInfoEditViewController.h
//  Mio
//
//  Created by Monster on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoEditCell.h"
#import "UserInfoViewController.h"

@interface UserInfoEditViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UserInfoEditCell* _editCell;
    UITableViewCell* _birthCell;
    UITableViewCell* _sexCell;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain)NSString* nameTitle;
@property (nonatomic, assign)NSUInteger type;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end
