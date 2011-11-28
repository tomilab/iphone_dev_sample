//
//  ViewController.h
//  Sample3
//
//  Created by johnny on 11/11/26.
//  Copyright (c) 2011 Tomilab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UILabel     *label1;
    IBOutlet UITextField *textField1;
    IBOutlet UIButton    *okButton;
    
}

// OKボタンが押されたときに呼ばれるメソッドの宣言
- (IBAction)okButtonPushed:(id)sender;


@end
