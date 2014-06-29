//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Chris Jones on 6/28/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic,readwrite) NSInteger score;
@property  (nonatomic,strong) NSMutableArray * cards; //of cards

@end

@implementation CardMatchingGame

// Lazy instantiation
-(NSMutableArray *)cards{
    
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    
    return _cards;
    
}

// count is the number of cards we want on the game screen
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    
    self = [super init];
    
    if(self){
        for(int i = 0; i < count; i++){
            Card * card = [deck drawRandomCard];
            
            if(card){
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
    
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


-(void)chooseCardAtIndex:(NSUInteger)index{
    
    Card * card = [self cardAtIndex:index];
    
    if(card){
     
        if(!card.isMatched){
            
            if(card.chosen){
                card.chosen = NO;
            }
            else{
                // This means we already have a card chosen somewhere in cards we want to see
                // if it matches to
                
                for(Card * otherCard in [self cards]){
                    
                    if(otherCard.isChosen && !otherCard.isMatched){
                        // see if they match
                        
                        int matchScore = [card match:@[otherCard]];
                        
                        if(matchScore){
                            self.score += matchScore * MATCH_BONUS;
                            card.matched = YES;
                            otherCard.matched = YES;
                        }
                        else{
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                        }
                        break;
                        
                    }
                    else{
                        
                    }
                }
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
            }
        }
    }
}


-(Card *) cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

-(void)startNewGame:(NSInteger)count usingDeck:(Deck*)deck{
    
    for(int i = 0; i < [self.cards count]; i++){
        Card * card = [self.cards objectAtIndex:i];
        
        if(card){
            [deck addCard:card];
            [self.cards removeObject:card];
            Card * newCard = [deck drawRandomCard];
            [self.cards addObject:newCard];
        }
        else{
            break;
        }
    }

    self.score = 0;
    
  
}

@end
