//
//  Card.h
//  CardMatching
//
//  Created by Tim Acorda on 12/19/14.
//  Copyright (c) 2014 Tim Acorda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic) BOOL chosen;
@property (nonatomic) BOOL matched;
- (int)match:(NSArray *)otherCards;
@end
