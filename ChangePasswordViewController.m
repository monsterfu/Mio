//
//  ChangePasswordViewController.m
//  Mio
//
//  Created by 符鑫 on 14-8-27.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

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
    UIView* view = [UIView new];
    [view setBackgroundColor:[UIColor clearColor]];
    [_tableView setTableFooterView:view];
    _nameArray = @[@"当前密码",@"新的密码",@"确认密码"];
    
    UIImage* rightImg = [UIImage imageNamed:@"icon_2"];
    UIBarButtonItem* _rightButton = [[UIBarButtonItem alloc]initWithImage:rightImg style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonPressed)];
    self.navigationItem.rightBarButtonItem = _rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)rightButtonPressed
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
    _changePswTableCell = [tableView dequeueReusableCellWithIdentifier:@"changePSWCell" forIndexPath:indexPath];
    _changePswTableCell.name.text = [_nameArray objectAtIndex:indexPath.row];
    if (indexPath.row == 1) {
        [_changePswTableCell.detail becomeFirstResponder];
    }
    return _changePswTableCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark -UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}
@end
