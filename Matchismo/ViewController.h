//
//  ViewController.h
//  Matchismo
//
//  Created by Chris Jones on 6/16/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)touchCardButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;


@end
