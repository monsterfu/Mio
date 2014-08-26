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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"userInfoEditIdentifier"])
    {
        NSIndexPath *indexPath = [_tableVIew indexPathForSelectedRow];
        UserInfoEditViewController* _userInfoEditViewController = (UserInfoEditViewController *)segue.destinationViewController;
        _userInfoEditViewController.nameTitle = [_titleNameArray objectAtIndex:indexPath.row];
        if (indexPath.row <= 2) {
            _userInfoEditViewController.type = UserInfoEnum_Type1;
        }else if (indexPath.row == 3) {
            _userInfoEditViewController.type = UserInfoEnum_Type2;
        }else if (indexPath.row == 4) {
            _userInfoEditViewController.type = UserInfoEnum_Type3;
        }
    }
}

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
//    if (indexPath.row == 0||indexPath.row == 1||indexPath.row == 2) {
//        [self performSegueWithIdentifier:@"userInfoEditIdentifier" sender:nil];
//    }
    [self performSegueWithIdentifier:@"userInfoEditIdentifier" sender:nil];
}
#pragma mark - actionSheet delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
    }else if (buttonIndex == 1) {
        [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
}
#pragma mark -photo about

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    //    if (self.imageView.isAnimating)
    //    {
    //        [self.imageView stopAnimating];
    //    }
    //
    //    if (self.capturedImages.count > 0)
    //    {
    //        [self.capturedImages removeAllObjects];
    //    }
    
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    _imagePickerController.sourceType = sourceType;
    _imagePickerController.delegate = self;
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        /*
         The user wants to use the camera interface. Set up our custom overlay view for the camera.
         */
        _imagePickerController.showsCameraControls = YES;
        
        /*
         Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
         */
        //        [[NSBundle mainBundle] loadNibNamed:@"OverlayView" owner:self options:nil];
        //        self.overlayView.frame = imagePickerController.cameraOverlayView.frame;
        //        imagePickerController.cameraOverlayView = self.overlayView;
        //        self.overlayView = nil;
    }
    
    //    self.imagePickerController = imagePickerController;
    [self.navigationController presentViewController:_imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    NSLog(@"didFinishPickingImage");
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo");
    UIImage* images;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
	{
		images = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
		UIImageWriteToSavedPhotosAlbum(images, self,
									   nil,
									   nil);
	}
	//获得编辑过的图片
    images = [info objectForKey: @"UIImagePickerControllerOriginalImage"];
	
    
    ImageCroperViewController* _imageCroperViewController = [[ImageCroperViewController alloc]initWithNibName:@"ImageCroperViewController" bundle:nil];
    _imageCroperViewController.delegate = self;
    _imageCroperViewController.editImage = images;
    [self dismissViewControllerAnimated:YES completion:^{
        [self.navigationController presentViewController:_imageCroperViewController animated:YES completion:nil];
    }];
    
    
	
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - delegate
-(void)useEditImage:(UIImage*)image
{
    [_headButton setImage:image forState:UIControlStateNormal];
    [_headButton setImage:image forState:UIControlStateHighlighted];
}

#pragma mark - button

- (IBAction)headButtonTouch:(UIButton *)sender {
    _actionSheetView =  [[UIActionSheet alloc]
                         initWithTitle:nil
                         delegate:self
                         cancelButtonTitle:NSLocalizedString(@"取消",nil)
                         destructiveButtonTitle:NSLocalizedString(@"拍照",nil)
                         otherButtonTitles:NSLocalizedString(@"从手机相册选择",nil),nil];
    _actionSheetView.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [_actionSheetView showInView:self.view];
}

- (IBAction)segmentedControlTouch:(UISegmentedControl *)sender {
}
@end
