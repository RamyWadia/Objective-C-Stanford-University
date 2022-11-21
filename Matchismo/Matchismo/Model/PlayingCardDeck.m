//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-21.
//

#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

/*
 a method returning an instancetype means that this method will return the an object which is of the same type the object you send this messege to.
 */
-(instancetype)init {
    // this is to check the return type of the super init making sure it is properly initialized, if it cannot initialize itself is should return nil.
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
