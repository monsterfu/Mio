//
//  LostViewController.h
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"
#import "recordAnnotation.h"

@interface LostViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchButtonTouch:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)lostRecordButtonTouch:(UIButton *)sender;
- (IBAction)emailButtonTouch:(UIButton *)sender;

@end
