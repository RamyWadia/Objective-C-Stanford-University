//
//  Deck.h
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-21.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

/*
 - This method has 2 arguments and separated name, do you see how amazing is this? Yes swift is great but objective-c has some magic that we still love.
 - To declare a methode with an optional arg, you repeat the same method excluding this arg, and in the implementation you implement the original method in the shorter one passing empty arg for the optional one.
 - if we need to do somthing (create an algorithm) not just returning a value, we use methode, Although we can use getter (in this case the method returning a Card) but this counts as a violation for the "getter"
 */
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end

