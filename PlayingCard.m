//
//  PlayingCard.m
//  CardMatching
//
//  Created by Tim Acorda on 12/19/14.
//  Copyright (c) 2014 Tim Acorda. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end


@implementation PlayingCard


@synthesize suit = _suit; //because we provide setter AND getter!!

-(int)match:(NSArray *)otherCards {
    int score = 0;
    if( [otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if ([self.suit isEqualToString:otherCard.suit]) {
            score = 1;
        } else if (self.rank == otherCard.rank) {
            score = 4;
        }
    }
    return score;
}
-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♥️",@"♠️", @"♣️", @"♦️"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return[[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

@end
