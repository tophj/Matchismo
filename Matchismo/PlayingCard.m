//
//  PlayingCard.m
//  Matchismo
//
//  Created by Chris Jones on 6/26/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;


-(NSString *) contents{
    
    NSArray *rankString = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}


+(NSArray *)validSuits {
    
    NSArray * suits = @[@"♣︎",@"♥︎",@"♦︎",@"♠︎"];
    return suits;
    
}
-(NSString *)suit{
    return _suit ? _suit : @"?";
    
}

-(void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        suit = suit;
    }
}

@end
