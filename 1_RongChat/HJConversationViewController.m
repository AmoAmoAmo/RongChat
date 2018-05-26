//
//  HJConversationViewController.m
//  1_RongChat
//
//  Created by Josie on 2018/5/27.
//  Copyright © 2018年 Josie. All rights reserved.
//
//  聊天页面

#import "HJConversationViewController.h"

@interface HJConversationViewController ()

@end

@implementation HJConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


// 即将显示消息Cell的回调
/*!  ----- RCMessageCell ----
 展示的消息Cell类
 
 @discussion 需要展示用户信息和内容的消息Cell可以继承此类，
 如：RCTextMessageCell、RCImageMessageCell、RCLocationMessageCell、RCVoiceMessageCell、RCRichContentMessageCell等。
 如果您需要显示自定义消息，可以继承此类。
 */
-(void)willDisplayMessageCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[RCImageMessageCell class]]) {
        
    }
}

@end
