//
//  PlayingCard.h
//  CardMatching
//
//  Created by Tim Acorda on 12/19/14.
//  Copyright (c) 2014 Tim Acorda. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
