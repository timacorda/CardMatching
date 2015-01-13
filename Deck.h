//
//  Deck.h
//  CardMatching
//
//  Created by Tim Acorda on 12/19/14.
//  Copyright (c) 2014 Tim Acorda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;

@end
