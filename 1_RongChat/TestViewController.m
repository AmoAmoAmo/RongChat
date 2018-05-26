//
//  TestViewController.m
//  1_RongChat
//
//  Created by Josie on 2018/5/25.
//  Copyright © 2018年 Josie. All rights reserved.
//

#import "TestViewController.h"
#import <RongIMKit/RongIMKit.h>

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 初始化一个-------聊天页面
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc] init];
    conversationVC.hidesBottomBarWhenPushed = YES;  // 平滑
    conversationVC.conversationType = ConversationType_PRIVATE;
    conversationVC.targetId = @"199";
    conversationVC.title = @"想显示的会话标题";
    [self.navigationController pushViewController:conversationVC animated:YES];
}

@end
