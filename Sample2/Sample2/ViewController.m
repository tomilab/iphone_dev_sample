//
//  ViewController.m
//  Sample2
//
//  Created by johnny on 11/11/26.
//  Copyright (c) 2011 Tomilab. All rights reserved.
//
//  このサンプルコードの概要:
//  * Hello, world!というラベルを作成して，それを画面に表示する．
//  * テキストフィールドを作成して，それを画面に表示する．
//  * ボタンを作成して，それを画面に表示する．
//  * ボタンを押すと，テキストフィールドの文字がラベルに反映される．

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

// インスタンス変数を開放するメソッド
- (void)dealloc
{
    [label1 release];     // label1をメモリから開放する
    [textField1 release]; // textField1をメモリから開放する
    [super dealloc];      // 必ず最後に書く
}

// ボタン1が押されたときに呼ばれるメソッド
- (void)okButtonPushed:(id)sender {
    label1.text = textField1.text; // textField1の文字列をラベルに反映させる
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Sample1と同様にラベルを作成して画面に表示する．
    // ただし，label1はこのクラスのインスタンス変数である．
    // label1の変数宣言は，ViewController.h の中で行われている．
    CGRect rect1 = CGRectMake(0, 0, 100, 40);
    label1 = [[UILabel alloc] initWithFrame:rect1];
    label1.text = @"Hello, world!";
    [self.view addSubview:label1];
    
    // テキストフィールドを作成する
    CGRect rect2 = CGRectMake(0, 50, 100, 20); // 四角形を作成する
    textField1 = [[UITextField alloc] initWithFrame:rect2]; // テキストフィールドを作成する
    textField1.backgroundColor = [UIColor whiteColor]; // テキストフィールドの背景色を設定する
    [self.view addSubview:textField1]; // テキストフィールドを親ビューに追加する
    
    // ボタンを作成する
    CGRect rect3 = CGRectMake(0, 100, 100, 30); // 四角形を作成する
    okButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]; // 角が丸いボタンを作成する
    okButton.frame = rect3;                      // ボタンのフレームを設定する
    [okButton setTitle:@"OK" forState:UIControlStateNormal]; // ボタンの文字列を設定する
    // ↓ボタンが押されたときにokButtonPushedメソッドを呼び出すようにする
    [okButton addTarget:self action:@selector(okButtonPushed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okButton]; // ボタンを親ビューに追加する
    
    // Q:
    // なぜokButtonをreleaseしないの？
    
    // A:
    // okButtonは，allocではなくbuttonWithTypeメソッドで生成されている．
    // このメソッドはいわゆる"便利メソッド"のひとつであり，これは内部でautoreleaseを呼び出す．
    // そのため，okButtonを明示的にreleaseする必要はない．
    
    // 演習:
    // 新しいボタン clearButton を作成して，画面に表示しよう．
    // ボタンの文字列は，"Clear" とする．
    // ボタンを押すと呼ばれるメソッドの名前はclearButtonPushedとする．
    // そのボタンを押すとlabel1の文字が消えるようにする．
    // ↓以下にコードを書く
    
    
}

// 下のviewDidUnloadメソッドは，アプリの実行中にメモリ不足になったときにだけ呼ばれる．
// 一旦メモリから開放しておいて，ビューを再び描画する必要が出たときに
// 再び上のviewDidLoadメソッドが呼ばれる．
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

    [label1 release];     // label1をメモリから開放する
    [textField1 release]; // textField1をメモリから開放する
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
