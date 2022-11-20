//
//  Card.h
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-20.
//

@import Foundation;
/*
 - or you can use the old syntax
 #import <Foundation/Foundation.h>
 - you import the all Foundation framwork, it does not empact much on the performance as it is highly precompiled and optimised.
 - NSObject is pretty much the super class of every class we create
 - You specify the super class in the h file
 */
@interface Card : NSObject

/*
 - You can add public declarations inside header file.
 - Pointers are good for bounce checking, set a property and update the UI and for initializing pointers (all properties start of nil).
 - *content because all objects live in the heap.
 Objective-C will manage all the memory, by refrence counting (not garbage collection).
 - And we define it by the (strong or weak) pointer.
 - for *contents the memory will be freed ASA there is no strong pointer remaining to it.
 - if it have been implemented as (weak) this means keep the memory until someone else has a strong pointer to it. It does not only clean it up but sets the pointer no nil.
 - nonatomic needs that this thing is not thread safe. As the way multithread happens in Objective-c is not by having multiple thread accessing the object at the same time, but the threads talk to each other thread to thread. Nonatomic makes the getter and setter simple, if you use atomic there will be some blocking code in them.
 - the getter and setter are set for @property object although we don't see them.
 */
@property (strong, nonatomic) NSString *contents;

/*
 - BOOL properties do not need (strong or weak) pointer as it is premitive type and is not stored in the heap.
 - we can rename the getter as you see below.
 */
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(Card *) card;

@end
