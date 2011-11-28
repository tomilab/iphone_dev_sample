//
//  main.m
//  Sample0
//
//  Created by johnny on 11/11/27.
//  Copyright (c) 2011 Tomilab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

// プログラムの開始点
// アプリの起動中はずっとmainがループしている．
int main(int argc, char *argv[])
{
    // 自動開放プールの設定
    @autoreleasepool {
        // あとの処理はすべてAppDelegateクラスにお任せする（AppDelegate.h, AppDelegate.m）
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
