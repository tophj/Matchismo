//
//  ViewController.m
//  Matchismo
//
//  Created by Chris Jones on 6/16/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    // we know it's not looking at the back and we can flip it.
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardBack"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal ];
        
        
    }
    else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState: UIControlStateNormal ];
    }
    self.flipCount++;
    
    
}
@end
