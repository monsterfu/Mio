//
//  GlobalHeader.h
//  Mio
//
//  Created by 符鑫 on 14-8-26.
//  Copyright (c) 2014年 Monster. All rights reserved.
//

#ifndef Mio_GlobalHeader_h
#define Mio_GlobalHeader_h

#import "UIColor+getColor.h"
#import <MapKit/MapKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "NSString+deviceName.h"
#import "ConnectionManager.h"

#define VISION_NO    @"1.1.2"
//#define NSLog(...) {}
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 ?YES:NO)
#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
#define DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define APP_BACKGROUND_COLOR  [UIColor colorWithRed:0 green:222/255.0 blue:111/255.0 alpha:1.0]

//弧度、角度转换
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))



#define KEY_DEVICE_INFO   @"key_device_info"
#define KEY_DEVICELIST_INFO   @"key_devicelist_info"         //设备列表


#define NSNotificationCenter_dismissRecordChange            @"NSNotificationCenter_dismissRecordChange"
#endif
