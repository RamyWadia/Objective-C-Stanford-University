//
//  PlayingCard.m
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-21.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit; // because we provide the setter and getter.


/*
 Notice that every string is a string object and the @ sign creates the object for you.
 */
-(NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)rankStrings {
   return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger)maxRank { return [[self rankStrings] count] - 1; }

// this is to prevent others from setting the rank to
// something we don't want.
-(void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
/*
 This is created just to get a cleaner code, but be careful as it will be created every time it is called. We could use a static variable, so it starts nil and if it is nill set it up to this array, and then it will be created only once.
 Remember that code cleanliness is more important than performance unless it is really needed.
 This method is set to a class not to an instance.
 Class methods is used mainly in 2 cases:
    1- creating things.
    2- untility methods like this one.
 */
+ (NSArray *) validSuits {
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

// this is to prevent others from setting the suit to
// something we don't want.
-(void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// overriding suit getter to return "?" if it points to nil
// in case of changing the getter name we use the new one.
-(NSString *) suit {
    return _suit ? _suit : @"?";
}



@end
