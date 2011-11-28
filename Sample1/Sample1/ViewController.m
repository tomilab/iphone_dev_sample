//
//  ViewController.m
//  Sample1
//
//  Created by johnny on 11/11/26.
//  Copyright (c) 2011 Tomilab. All rights reserved.
//
//  このサンプルコードの概要:
//  Hello, world!というラベルを作成して，画面に表示する．

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect1 = CGRectMake(0, 0, 100, 40); // 四角形をつくる（X座標0，Y座標0，幅100px，高さ40px）
    UILabel *label1 = [[UILabel alloc] initWithFrame:rect1]; // UILabelのインスタンス label1 をつくる
    label1.text = @"Hello, world!"; // label1の文字列として "Hello, world!" を設定する
    [self.view addSubview:label1];  // label1を親ビューに追加する
    [label1 release];               // label1のインスタンスを開放する

    
    // Q:
    // なぜここでlabel1のインスタンスを開放しても良いの？
    // label1は画面表示に必要だから開放してはいけないのでは？
    
    // A:
    // 上記コードのaddSubViewメソッドが内部でlabel1をretainするから．
    // これによって，label1の参照カウントは2になる．
    // その後，label1を1回releaseすることで，label1の参照カウントを1に戻している．
    
    // ポイント:
    // addSubViewしたものは，すぐにreleaseしよう．
    
    // 演習:
    // 新いラベル label2 を作成して，画面に表示しよう．
    // X座標0，Y座標100，幅100px，高さ40px のラベルを作成する．
    // ラベルの文字列は，"Goodbye, world!" とする．
    // ↓以下にコードを書く
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
