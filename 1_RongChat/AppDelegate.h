//
//  AppDelegate.h
//  1_RongChat
//
//  Created by Josie on 2018/3/30.
//  Copyright © 2018年 Josie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <RongIMKit/RongIMKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, RCIMConnectionStatusDelegate, RCIMUserInfoDataSource>

@property (strong, nonatomic) UIWindow *window;


@end

