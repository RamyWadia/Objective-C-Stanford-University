//
//  PlayingCard.h
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-21.
//
#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
// we use NSUinteger instead of unsigned int as it
// can adapt to the processor archetecture.
@property (nonatomic) NSUInteger rank;

// Now validSuits is public.
+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end

