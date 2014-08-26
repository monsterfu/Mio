//
//  ChangePasswordViewController.h
//  Mio
//
//  Created by 符鑫 on 14-8-27.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "changePswCell.h"

@interface ChangePasswordViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    changePswCell* _changePswTableCell;
    NSArray* _nameArray;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
