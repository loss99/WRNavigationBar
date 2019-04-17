//
//  WRHelper.m
//  CoolMarket
//
//  Created by ruixingchen on 4/16/19.
//  Copyright © 2019 CoolApk. All rights reserved.
//

#import "WRHelper.h"

@implementation WRHelper

///判断是否是圆角屏幕
+ (BOOL)isRoundCornerScreen {
    BOOL round = NO;

    // 判断安全区域, 只支持 iOS11 以上
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
        round = mainWindow.safeAreaInsets.top > 0.0;
    }

    return round;
}

+ (UIEdgeInsets)mainWindowSafeAreaInsets {
    return [UIApplication sharedApplication].keyWindow.safeAreaInsets;
}

///设备的状态栏高度, 不管状态栏是否显示
+ (CGFloat)deviceStatusBarHeight {
    CGFloat height = [WRHelper currentStatusBarHeight];
    if (height > 0) {
        return height;
    }
    height = 20;
    UIEdgeInsets windowInset = [WRHelper mainWindowSafeAreaInsets];
    if (windowInset.top > height) {
        //这样就可以兼容全面屏 iPad 了
        height = windowInset.top;
    }
    return height;
}

///设备当前的状态栏高度, 隐藏的话则为 0
+ (CGFloat)currentStatusBarHeight {
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (CGFloat)navBarHeight {
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        if (@available(iOS 12.0, *)) {
            return 50;
        }
    }
    return 44;
}

+ (CGFloat)navBarBottom {
    CGFloat height = [WRHelper currentStatusBarHeight] + [WRHelper navBarHeight];
    return height;
}

+ (CGFloat)tabBarHeight {
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        if (@available(iOS 12.0, *)) {
            return 50;
        }
    }
    return 49;
}

+ (CGFloat) tabBarTop {
    return [WRHelper mainWindowSafeAreaInsets].bottom + [WRHelper tabBarHeight];
}

+ (CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

@end


