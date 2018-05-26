//
//  HJListViewController.m
//  1_RongChat
//
//  Created by Josie on 2018/4/4.
//  Copyright © 2018年 Josie. All rights reserved.
//

#import "HJListViewController.h"

@interface HJListViewController ()



@end

@implementation HJListViewController




- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setMyConversationTypes];
    }
    return self;
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    printLog();
    
    if (!self.isEnteredVC) {
        //
        [self setMyConversationTypes];
    }
    
    

}


/*!
 设置会话类型等
 */
-(void)setMyConversationTypes
{
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_GROUP)
                                        ]];
    //设置需要将哪些类型的会话在会话列表中---聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP),
                                          @(ConversationType_PRIVATE)]];
}



#pragma mark - 重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    printLog();
    
    // 判断 如果会话类型为聚合类型时
    if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_COLLECTION) {
        // 再创建一个会话列表
        HJListViewController *tempVC = [[HJListViewController alloc] init];
        // 得到显示的会话类型
        NSArray *typeArray = [NSArray arrayWithObject:[NSNumber numberWithInt:model.conversationType]];
        // 把该类型设给会话列表
        [tempVC setDisplayConversationTypes:typeArray];
        // 不再需要聚合显示
        [tempVC setCollectionConversationType:nil];
        tempVC.isEnteredToCollectionViewController = YES;
        tempVC.isEnteredVC = YES;
        tempVC.hidesBottomBarWhenPushed = YES;  // 平滑
        tempVC.title = @"test-test";
        [self.navigationController pushViewController:tempVC animated:YES];
    }
    
    
    else if (model.conversationType == ConversationType_PRIVATE){
        
        
        // 初始化一个-------聊天页面
        RCConversationViewController *conversationVC = [[RCConversationViewController alloc] init];
        conversationVC.hidesBottomBarWhenPushed = YES;  // 平滑
        conversationVC.conversationType = model.conversationType;
        conversationVC.targetId = model.targetId;
        conversationVC.title = @"想显示的会话标题";
        [self.navigationController pushViewController:conversationVC animated:YES];
    }
    
    
}



// 将要显示对话table列表的cell
- (void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell
                             atIndexPath:(NSIndexPath *)indexPath
{
    RCConversationModel *model = self.conversationListDataSource[indexPath.row];
    
    if (model.conversationType == ConversationType_PRIVATE) {
        RCConversationCell *conversationCell = (RCConversationCell *)cell;
        // 设置昵称的字体颜色
        conversationCell.conversationTitle.textColor = [UIColor redColor];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
