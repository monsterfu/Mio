//
//  UserInfoViewController.h
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoEditViewController.h"
#import "ImageCroperViewController.h"

typedef enum : NSUInteger {
    UserInfoEnum_Type1,
    UserInfoEnum_Type2,
    UserInfoEnum_Type3,
} UserInfoEnum_TypeEnum;

@interface UserInfoViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ImageCroperViewControllerDelegate>
{
    NSArray* _titleNameArray;
    UIActionSheet* _actionSheetView;
    UIImagePickerController* _imagePickerController;
}
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;

//头像
@property (weak, nonatomic) IBOutlet UIButton *headButton;
- (IBAction)headButtonTouch:(UIButton *)sender;

- (IBAction)segmentedControlTouch:(UISegmentedControl *)sender;

@end
