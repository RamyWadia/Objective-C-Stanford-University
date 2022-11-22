//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-21.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

// here we give ourselves the bility to write the score.
// the only time we use (readwrite) is when we redeclare
// (readonly) otherwise (readwrite) is the default.
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of cards

@end

@implementation CardMatchingGame

-(NSMutableArray *) cards {
    if (!_cards) _cards = [NSMutableArray new];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        if (count < 2) { return nil; }
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
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
// another way to define the MISMATCH_PENALTY
// #define MISMATCH_PENALTY 2

-(void)chooseCarAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against other cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

-(instancetype)init { return nil; }


@end
