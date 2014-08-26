//
//  MioSettingViewController.m
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "MioSettingViewController.h"

@interface MioSettingViewController ()

@end

@implementation MioSettingViewController

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
    _nameArray = [NSArray arrayWithObjects:@"Mio名称",@"当前电量",@"报警距离",@"报警铃声",@"环境",@"当前温度",@"温度显示min",@"报警温度", nil];
    _cellSelectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 44)];
    _cellSelectionView.backgroundColor = [UIColor getColor:@"63c463"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
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
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_nameArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"mioSettingCell0" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1|| indexPath.row >=5) {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"mioSettingCell1" forIndexPath:indexPath];
        cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
        return cell;
        
    }else if(indexPath.row == 4)
    {
        _mieHJCell = [tableView dequeueReusableCellWithIdentifier:@"mioSettingCell3" forIndexPath:indexPath];
        _mieHJCell.delegate = self;
        return _mieHJCell;
    }else {//if(indexPath.row == 2||indexPath.row == 3){
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"mioSettingCell2" forIndexPath:indexPath];
        cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
        cell.selectedBackgroundView = _cellSelectionView;
        return cell;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
    }
    
}

#pragma mark - mioHJCellDelegate

-(void)mioHJCellSegmentTouch:(UISegmentedControl *)sender
{
    
}
@end
