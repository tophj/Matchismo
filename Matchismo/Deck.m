//
//  Deck.m
//  Matchismo
//
//  Created by Chris Jones on 6/17/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end



@implementation Deck
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard{
    
    Card * returnCard = nil;
    
    //arc4random returns a random int
    unsigned index = arc4random() % [self.cards count];
    returnCard = self.cards[index];
    [self.cards removeObjectAtIndex:index];
    
    return returnCard;
    
    
}
@end