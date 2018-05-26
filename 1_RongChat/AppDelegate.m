//
//  AppDelegate.m
//  1_RongChat
//
//  Created by Josie on 2018/3/30.
//  Copyright © 2018年 Josie. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "HJListViewController.h"

#define MY_APPKEY   @"0vnjpoad06ezz"
#define MY_TOKEN    @"ktISXFSQj4qivO7IBWLnh6e9cQWfiBGghfrMmVJTK6ApkpsIMwDTHQx+C6XocFJsR1G5cvGQ8wY="

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    
    
    
    
    //融云即时通讯
    
    //初始化融云SDK。
    [[RCIM sharedRCIM] initWithAppKey:MY_APPKEY];
    
    //连接融云
    [[RCIM sharedRCIM] connectWithToken:MY_TOKEN success:^(NSString *userId) {
        
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        
        
        // 连接成功后 设置代理(用户信息代理)
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        
        /*  设置当前登录用户信息
            与融云服务器建立连接之后，应该设置当前用户的用户信息，用于SDK显示和发送
        */
        [RCIM sharedRCIM].currentUserInfo.userId = @"133";
        [RCIM sharedRCIM].currentUserInfo.name = @"wo";
        [RCIM sharedRCIM].currentUserInfo.portraitUri = @"https://img-blog.csdn.net/2018032015362964";
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", (long)status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
    }];
    
    
    return YES;
}


// 设置会话的头像和昵称等   是好友的头像和昵称，不是自己的
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion
{
    NSLog(@"------ userID = %@ ---------", userId);
    // 设置用户头像
    if ([userId isEqualToString:@"199"]) {
        RCUserInfo *userInfo = [[RCUserInfo alloc] init];
        userInfo.userId = userId;
        userInfo.name = @"小月月";
        userInfo.portraitUri = @"https://img-blog.csdn.net/20180401185902182";
        
        return completion(userInfo);
    }
    if ([userId isEqualToString:@"233"]) {
        RCUserInfo *userInfo = [[RCUserInfo alloc] init];
        userInfo.userId = userId;
        userInfo.name = @"baby";
        userInfo.portraitUri = @"https://img-blog.csdn.net/2018032015362964";
        
        return completion(userInfo);
    }
    return completion(nil);
}



/*!
 IMKit连接状态的的监听器
 
 @param status  SDK与融云服务器的连接状态
 
 @discussion 如果您设置了IMKit消息监听之后，当SDK与融云服务器的连接状态发生变化时，会回调此方法。
 */
- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status
{
    printf("*******************\n");
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
