//
//  UserInfoViewController.m
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleNameArray = @[@"姓",@"名",@"邮箱",@"生日",@"性别",@"修改密码"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -UITbaleViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }else
        return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* settingCell;
    if (indexPath.section == 0) {
        if (indexPath.row <= 1) {
            settingCell = [tableView dequeueReusableCellWithIdentifier:@"userInfoCell" forIndexPath:indexPath];
        }else{
            settingCell = [tableView dequeueReusableCellWithIdentifier:@"userInfoCell1" forIndexPath:indexPath];
        }
        settingCell.textLabel.text = [_titleNameArray objectAtIndex:indexPath.row];
    }else{
        settingCell = [tableView dequeueReusableCellWithIdentifier:@"userInfoCell1" forIndexPath:indexPath];
        settingCell.textLabel.text = [_titleNameArray lastObject];
    }
//    settingCell.selectedBackgroundView = _cellSelectionView;
    
    
    return settingCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
    }
    
}
@end
