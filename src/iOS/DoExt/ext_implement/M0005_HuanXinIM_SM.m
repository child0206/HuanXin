//
//  M0005_HuanXinIM_SM.m
//  DoExt_SM
//
//  Created by @userName on @time.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "M0005_HuanXinIM_SM.h"

#import "doScriptEngineHelper.h"
#import "doIScriptEngine.h"
#import "doInvokeResult.h"
#import "doJsonNode.h"
#import "ChatViewController.h"
#import "EaseMob.h"
#import "UIViewController+HUD.h"
//#import "HuanXinUIDefine.h"
#import "WCAlertView.h"
#import "doIPage.h"

@implementation M0005_HuanXinIM_SM
#pragma mark -
#pragma mark - 同步异步方法的实现
/*
 1.参数节点
     doJsonNode *_dictParas = [parms objectAtIndex:0];
     a.在节点中，获取对应的参数
     NSString *title = [_dictParas GetOneText:@"title" :@"" ];
     说明：第一个参数为对象名，第二为默认值
 
 2.脚本运行时的引擎
     id<doIScriptEngine> _scritEngine = [parms objectAtIndex:1];
 
 同步：
 3.同步回调对象(有回调需要添加如下代码)
     doInvokeResult *_invokeResult = [parms objectAtIndex:2];
     回调信息
     如：（回调一个字符串信息）
     [_invokeResult SetResultText:((doUIModule *)_model).UniqueKey];
 异步：
 3.获取回调函数名(异步方法都有回调)
     NSString *_callbackName = [parms objectAtIndex:2];
     在合适的地方进行下面的代码，完成回调
     新建一个回调对象
     doInvokeResult *_invokeResult = [[doInvokeResult alloc] init];
     填入对应的信息
     如：（回调一个字符串）
     [_invokeResult SetResultText: @"异步方法完成"];
     [_scritEngine Callback:_callbackName :_invokeResult];
 */
//同步
 - (void)enterChat:(NSArray *)parms
 {
     doJsonNode *_dictParas = [parms objectAtIndex:0];
     //js引擎
     id<doIScriptEngine> _scritEngine = [parms objectAtIndex:1];
     
     //自己的代码实现
     
     NSString *userName = [_dictParas GetOneText:@"username" :@""];
     //通过用户名得到聊天会话对象
     EMConversation *conversation = [[EaseMob sharedInstance].chatManager conversationForChatter:userName isGroup:NO];
     NSString *chatter = conversation.chatter;
     //初始化聊天控制器
     ChatViewController *chatVC = [[ChatViewController alloc]initWithChatter:chatter isGroup:NO];
     id<doIPage>pageModel = _scritEngine.CurrentPage;
     UIViewController *currentVC = (UIViewController *)pageModel.PageView;
     [currentVC presentViewController:chatVC animated:YES completion:^{
         
     }];
 }
- (void)logout:(NSArray *)parms
{
     [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES];
}
//异步
- (void)login:(NSArray *)parms
{
    doJsonNode *_dictParas = [parms objectAtIndex:0];
    id<doIScriptEngine> _scritEngine = [parms objectAtIndex:1];
    //自己的代码实现
    
    NSString *_callbackName = [parms objectAtIndex:2];
    doInvokeResult *_invokeResult = [[doInvokeResult alloc] init];
    NSString * userName = [_dictParas GetOneText:@"username" :@""];
    NSString * userPwd = [_dictParas GetOneText:@"password" :@""];
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:userName password:userPwd completion:^(NSDictionary *loginInfo, EMError *error) {
        doJsonNode *infoNode = [[doJsonNode alloc]init];
        if (!error && loginInfo)
        {
            [infoNode SetOneText:@"state" :@"0成功"];
            for (NSString * key in loginInfo.allKeys) {
                [infoNode SetOneText:key :loginInfo[key]];
            }
        }
        else
        {
            [infoNode SetOneText:@"state" :@"1失败"];
            [infoNode SetOneText:@"message" :error.description];
        }
        [_invokeResult SetResultNode:infoNode];
        [_scritEngine Callback:_callbackName :_invokeResult];
    } onQueue:nil];
}

@end




























