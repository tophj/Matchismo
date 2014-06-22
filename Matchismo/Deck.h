//
//  Deck.h
//  Matchismo
//
//  Created by Chris Jones on 6/17/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end