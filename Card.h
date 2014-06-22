//
//  Card.h
//  Matchismo
//
//  Created by Chris Jones on 6/17/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property(nonatomic,getter = isChosen) BOOL chosen;
@property(nonatomic,getter = isMatched) BOOL matched;

-(int)match:(NSArray*) otherCards;



@end
