//
//  UserInfoEditViewController.m
//  Mio
//
//  Created by Monster on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "UserInfoEditViewController.h"

@interface UserInfoEditViewController ()

@end

@implementation UserInfoEditViewController

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
    self.title = _nameTitle;
    
    if (_type == UserInfoEnum_Type2) {
        [_datePicker setHidden:NO];
    }
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
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_type == UserInfoEnum_Type3) {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == UserInfoEnum_Type1) {
        _editCell = [tableView dequeueReusableCellWithIdentifier:@"userInfoEditCell" forIndexPath:indexPath];
        _editCell.textField.delegate = self;
        _editCell.nameField.text = _nameTitle;
        [_editCell.textField becomeFirstResponder];
        return _editCell;
    }else if (_type == UserInfoEnum_Type2){
        _birthCell = [tableView dequeueReusableCellWithIdentifier:@"userInfoEditCell1" forIndexPath:indexPath];
        _birthCell.textLabel.text = _nameTitle;
        return _birthCell;
    }else{
        NSArray* sexArray = @[@"男",@"女"];
        _sexCell = [tableView dequeueReusableCellWithIdentifier:@"userInfoEditCell1" forIndexPath:indexPath];
        _sexCell.textLabel.text = [sexArray objectAtIndex:indexPath.row];
        return _sexCell;
    }
    
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
