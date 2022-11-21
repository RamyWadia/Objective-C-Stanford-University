//
//  Deck.m
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-21.
//
#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // of cards

@end

@implementation Deck

// Notice: [NSMutableArray new]; is the same like
// [[NSMutableArray alloc] init];
// but it was issued after this course was released. 
-(NSMutableArray *)cards {
    if (!_cards) _cards = [NSMutableArray new]; // lazy instantiation
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop {
    // as we have overritten the getter of the cards
    // array we know it will never be nil so no need
    // to check it here.
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

-(void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard {
    Card *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
        return randomCard;
}

@end
