//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-21.
//

#import <Foundation/Foundation.h>
#import "Deck.h"


@interface CardMatchingGame : NSObject

// designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck *)deck;

-(void)chooseCarAtIndex:(NSUInteger) index;
-(Card *)cardAtIndex:(NSUInteger) index;

// no setter for the score, I am the only one who
// can set it, so it is publicly readonly, and could be rewritten only privately
@property (nonatomic, readonly) NSInteger score;
@end
