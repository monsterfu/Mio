//
//  LostViewController.m
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#import "LostViewController.h"

@interface LostViewController ()

@end

@implementation LostViewController

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
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 3;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1000;
    [_imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    _mapView.layer.cornerRadius = 30.0f;
    _mapView.layer.borderWidth = 1.0f;
    _mapView.layer.borderColor = [[UIColor getColor:@"63c463"]CGColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - map

-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) coords title:(NSString*)title subtitle:(NSString*)subtitle {
    recordAnnotation *annotation = [[recordAnnotation alloc] initWithCoordinate:
                                    coords];
    annotation.title = title;
    annotation.subtitle = subtitle;
    [_mapView addAnnotation:annotation];
    
    
    //    NSString *strLat = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.latitude];
    //    NSString *strLng = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.longitude];
    //    NSLog(@"Lat: %@  Lng: %@", strLat, strLng);
    
    //    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(newLocation.coordinate.latitude,newLocation.coordinate.longitude);
    float zoomLevel = 0.02;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords,MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
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
-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *newAnnotation=[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation1"];
    newAnnotation.image = [UIImage imageNamed:@"zhen.png"];
    newAnnotation.canShowCallout=YES;
    newAnnotation.selected = YES;
    return newAnnotation;
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

- (IBAction)searchButtonTouch:(UIButton *)sender {
}
- (IBAction)lostRecordButtonTouch:(UIButton *)sender {
}

- (IBAction)emailButtonTouch:(UIButton *)sender {
}
@end
