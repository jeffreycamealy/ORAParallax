//
//  AppDelegate.m
//  Parallax
//
//  Created by Jeffrey Camealy on 1/23/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "ParallaxTVC.h"

@interface AppDelegate () {
    UIWindow *mainWindow;
}
- (UIWindow *)makeMainWindow;
@end

@implementation AppDelegate

#pragma mark - App Delegate Methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    mainWindow = [self makeMainWindow];
    mainWindow.rootViewController = [[ParallaxTVC alloc] init];
    
    return YES;
}


#pragma mark - Private API

- (UIWindow *)makeMainWindow {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    return window;
}


@end
