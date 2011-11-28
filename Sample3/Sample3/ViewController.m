//
//  ViewController.m
//  Sample3
//
//  Created by johnny on 11/11/26.
//  Copyright (c) 2011 Tomilab. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [label1 release];      // label1のインスタンスを開放する
    [textField1 release];  // textField1のインスタンスを開放する
    [okButton release];    // okButtonのインスタンスを開放する
}

// OKボタンが押されたときに呼ばれるメソッド
- (IBAction)okButtonPushed:(id)sender
{
    label1.text = textField1.text;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ボタンなどは既にInterface Builderで作られているので，何もしない．
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    [label1 release];      label1      = nil; // label1のインスタンスを開放する      // label1のOutlet接続を切る
    [textField1 release];  textField1  = nil; // textField1のインスタンスを開放する  // textField1のOutlet接続を切る
    [okButton release];    okButton    = nil; // okButtonのインスタンスを開放する    // okButtonのOutlet接続を切る
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
