//
//  mioHJCell.h
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol mioHJCellDelegate <NSObject>
-(void)mioHJCellSegmentTouch:(UISegmentedControl *)sender;
@end

@interface mioHJCell : UITableViewCell

@property (nonatomic,assign)id<mioHJCellDelegate>delegate;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
- (IBAction)segmentControlTouch:(UISegmentedControl *)sender;

@end
