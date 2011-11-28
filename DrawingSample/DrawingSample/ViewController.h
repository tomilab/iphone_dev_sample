//
//  ViewController.h
//  hoge
//
//  Created by johnny on 11/11/04.
//  Copyright (c) 2011 Tomilab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    // dealloc, viewDidUnload時にreleaseする必要があるもの
    IBOutlet UIImageView     *canvas;
    IBOutlet UIBarButtonItem *saveButton;
    IBOutlet UIBarButtonItem *deleteButton;
    IBOutlet UIButton *whiteButton;
    IBOutlet UIButton *blackButton;
    IBOutlet UIButton *redButton;
    
    // releaseの必要がないもの
    CGPoint touchPoint;
    float rgbRed, rgbGreen, rgbBlue;
}

- (IBAction)whiteButtonTapped:(id)sender;
- (IBAction)blackButtonTapped:(id)sender;
- (IBAction)redButtonTapped:(id)sender;
- (IBAction)deleteButtonTapped:(UIBarButtonItem *)deleteButton;
- (IBAction)saveButtonTapped:(UIBarButtonItem *)saveButton;

@end
