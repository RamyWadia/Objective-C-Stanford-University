//
//  Card.m
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-20.
//

// Import your header file to be able to access it.
#import "Card.h"

/*
 - you can add private declaration inside this interface.
 - objective-c does not require that you declare something before you use it like other languages.
 */
@interface Card()

@end

// You do not specify the super class in @implementation file
@implementation Card

-(int)match:(NSArray *)otherCards {
    int score = 0;
    // dot notation is only used for properties.
    // we did not use the operation == because we're just
    // comparing the pointers.
    // cards.contents here is RECEIVER
    // isEqualToString is the message
    // self.contents here is the argument being passedwith the message
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}


@end

