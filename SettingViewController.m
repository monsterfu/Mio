//
//  SettingViewController.m
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    
    if (![self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)])
    {
        self.navigationController.navigationBar.tintColor = [UIColor getColor:@"63c463"];
        self.navigationController.navigationBar.translucent = NO;
    }else{
        self.navigationController.navigationBar.barTintColor = [UIColor getColor:@"63c463"];
        self.navigationController.navigationBar.translucent = NO;
    }
    
    
    _settingNameArray = [NSArray arrayWithObjects:@"个人资料",@"Mio设置",@"佩戴位置",@"论坛",@"报表周期",@"隐私政策",@"关于我们", nil];
    _cellSelectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 44)];
    _cellSelectionView.backgroundColor = [UIColor getColor:@"63c463"];
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
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else if(section == 1)
    {
        return 2;
    }else
        return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* settingCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"settingCell%d",indexPath.row+1] forIndexPath:indexPath];
    settingCell.selectedBackgroundView = _cellSelectionView;
    return settingCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
    }
    
}
@end
