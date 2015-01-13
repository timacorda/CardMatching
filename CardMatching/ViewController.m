//
//  ViewController.m
//  CardMatching
//
//  Created by Tim Acorda on 12/18/14.
//  Copyright (c) 2014 Tim Acorda. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchControl;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) Deck *deckofcards;
@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
@end

@implementation ViewController


- (IBAction)slideSegmentedControl:(id)sender {
    
}

- (CardMatchingGame *) game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                                                                usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)deckofcards {
    
    if(!_deckofcards) _deckofcards = [self createDeck];
    return _deckofcards;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}
- (IBAction)touchredealButton:(UIButton *)sender {
    _game = nil;
    self.deckofcards = nil;
    [self game];
    [self updateUI];
    
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleforCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.matched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d" , (int)self.game.score];
}

- (NSString *)titleforCard:(Card *)card {
    return card.chosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.chosen ? @"cardfront" : @"cardback"];
}
@end
