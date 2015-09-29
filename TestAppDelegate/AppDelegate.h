//
//  AppDelegate.h
//  TestAppDelegate
//
//  Created by Apple on 15/9/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *mainViewController;
@property (strong, nonatomic) UINavigationController *newsViewController;
@property (strong, nonatomic) UINavigationController *friendsViewController;
@property (strong, nonatomic) UINavigationController *mineViewController;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end

