//
//  ViewController.m
//  DrawingSample
//
//  Created by johnny on 11/11/04.
//  Copyright (c) 2011 Tomilab. All rights reserved.
//


#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [canvas release];
    [saveButton release];
    [deleteButton release];
    [whiteButton release];
    [blackButton release];
    [redButton release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // タッチ開始座標をインスタンス変数touchPointに保持
    UITouch *touch = [touches anyObject];
    touchPoint = [touch locationInView:canvas];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //// セットされている画像の描画処理ここまで ////
    
    // 現在のタッチ座標をローカル変数currentPointに保持する
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:canvas];
    
    // 描画領域をcanvasの大きさで生成する
    UIGraphicsBeginImageContext(canvas.frame.size);
    
    // canvasにセットされている画像（UIImage）を描画する
    [canvas.image drawInRect:
     CGRectMake(0, 0, canvas.frame.size.width, canvas.frame.size.height)];
    
    
    ////// 線の設定 //////////////////////////////////////////////////////////////////////
    
    // 線の角を丸くする
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    // 線の太さを指定する
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0);
    
    // 線の色を指定する（RGB）
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), rgbRed, rgbGreen, rgbBlue, 1.0);
    
    // 線の描画開始座標をセットする
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    
    // 線の描画終了座標をセットする
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    
    
    ////// 描画処理 //////////////////////////////////////////////////////////////////////
    
    // 描画の開始〜終了座標まで線を引く
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    // 描画領域を画像（UIImage）としてcanvasにセットする
    canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    
    
    ////// 後始末 ////////////////////////////////////////////////////////////////////////    
    
    // 描画領域をクリアする
    UIGraphicsEndImageContext();
    
    
    // 現在のタッチ座標を次の開始座標にセットする
    touchPoint = currentPoint;
    
}

// 色選択ボタンがタップされたときに呼ばれるメソッド
- (IBAction)whiteButtonTapped:(id)sender
{
    rgbRed = rgbGreen = rgbBlue = 1.0;
}

- (IBAction)blackButtonTapped:(id)sender
{
    rgbRed = rgbGreen = rgbBlue = 0.0;
}

- (IBAction)redButtonTapped:(id)sender
{
    rgbRed = 1.0;
    rgbGreen = rgbBlue = 0.0;
}

- (IBAction)deleteButtonTapped:(UIBarButtonItem *)deleteButton
{
    canvas.image = nil; // キャンバスをクリアする
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)saveButton
{
    UIImageWriteToSavedPhotosAlbum(canvas.image, self, @selector(savingImageIsFinished:didFinishSavingWithError:contextInfo:), nil);
}

- (void)savingImageIsFinished:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存" message:@"絵を保存しました" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    rgbRed   = 0.0;
    rgbBlue  = 0.0;
    rgbGreen = 0.0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    [canvas release];       canvas = nil;
    [saveButton release];   saveButton = nil;
    [deleteButton release]; deleteButton = nil;
    [whiteButton release];  whiteButton = nil;
    [blackButton release];  blackButton = nil;
    [redButton release];    redButton = nil;
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
