//
//  HJListViewController.h
//  1_RongChat
//
//  Created by Josie on 2018/4/4.
//  Copyright © 2018年 Josie. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface HJListViewController : RCConversationListViewController


/*!
 判断当前会话列表是否为从聚合Cell点击进入的子会话列表
 */
@property (nonatomic, assign) BOOL isEnteredVC;

@end
