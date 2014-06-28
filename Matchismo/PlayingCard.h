//
//  PlayingCard.h
//  Matchismo
//
//  Created by Chris Jones on 6/26/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;




+(NSArray *)validSuits;
+(NSUInteger ) maxRank;

@end
