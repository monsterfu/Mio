//
//  MioSettingViewController.h
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mioHJCell.h"
#import "GlobalHeader.h"

@interface MioSettingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,mioHJCellDelegate>
{
    NSArray* _nameArray;
    mioHJCell* _mieHJCell;
    UIView* _cellSelectionView;
}
@end
