//
//  PlayingCardDeck.m
//  CardMatching
//
//  Created by Tim Acorda on 12/24/14.
//  Copyright (c) 2014 Tim Acorda. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype)init {
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
        
        
        
        
    }
    
    return self;
    
    
    
}
@end
