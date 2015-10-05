//
//  AppDelegate.m
//  TestAppDelegate
//
//  Created by Apple on 15/9/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "NewsViewController.h"
#import "FriendsViewController.h"
#import "MineViewController.h"
@interface AppDelegate ()<UITabBarDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setUI];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)setUI{
    _window = [[UIWindow alloc]init];
    _window.frame = [[UIScreen mainScreen] bounds];
    //_window.backgroundColor = [UIColor blackColor];
    
    _tabBarController = [[UITabBarController alloc]init];
    MainViewController *mainView = [[MainViewController alloc]init];
    NewsViewController *newsView = [[NewsViewController alloc]init];
    FriendsViewController *friendsView = [[FriendsViewController alloc]init];
    MineViewController *mineView = [[MineViewController alloc]init];
    
    UITabBarItem *mainItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"1"] tag:1];
    UITabBarItem *newsItem = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"2"] tag:2];
    UITabBarItem *friendsItem = [[UITabBarItem alloc]initWithTitle:@"圈子" image:[UIImage imageNamed:@"3"] tag:3];
    UITabBarItem *mineItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[UIImage imageNamed:@"4"] tag:4];
    
    _mainViewController = [[UINavigationController alloc]initWithRootViewController:mainView];
    _mainViewController.tabBarItem = mainItem;
    _newsViewController = [[UINavigationController alloc]initWithRootViewController:newsView];
    _newsViewController.tabBarItem = newsItem;
    _friendsViewController = [[UINavigationController alloc]initWithRootViewController:friendsView];
    _friendsViewController.tabBarItem = friendsItem;
    _mineViewController = [[UINavigationController alloc]initWithRootViewController:mineView];
    _mineViewController.tabBarItem = mineItem;
    
    if ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1]intValue]>=7) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        _mainViewController.navigationBar.translucent = YES;
        _newsViewController.navigationBar.translucent = YES;
        _friendsViewController.navigationBar.translucent = YES;
        _mineViewController.navigationBar.translucent = YES;
        [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    }
    
    
    [_tabBarController setViewControllers:[NSMutableArray arrayWithObjects:_mainViewController,_newsViewController,_friendsViewController,_mineViewController, nil]];
    
    _tabBarController.hidesBottomBarWhenPushed = YES;
    _tabBarController.selectedIndex = 0;
    _tabBarController.delegate = self;
    _window.userInteractionEnabled = YES;
    [_window setRootViewController:_tabBarController];
    [_window makeKeyAndVisible];
    
    _tabBarController.tabBar.selectedImageTintColor = [UIColor redColor];
   
}






















@end
