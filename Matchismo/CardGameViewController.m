//
//  ViewController.m
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-20.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
//this is an array of UIButton and order is unknown.
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

// lazy initialization
-(CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc]
                         initWithCardCount: [self.cardButtons count]
                         usingDeck:[self createDeck]];
    return _game;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// in few weeks you'll see how to make this more generic and
// get rid of the import PlayingCardDeck and creating a new one
// to a more generic way.
-(Deck *)createDeck {
    return [PlayingCardDeck new];
}


// repeating the same line of code for self.flipCount++
// is not best practice, it would have been better if an
// algorithm created to fix that. also simplicity  and elegance
// are important so it is kinda what is the best balance.
// The sender in this method is the actual button you touch not cardButtons array.
- (IBAction)touchCardButton:(UIButton *)sender {
    // everything was in this method before is remove as
    // we want the model to do all the logic for us.
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCarAtIndex:cardIndex];
    [self updateUI];
}

-(void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                               forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score %d", self.game.score];
}

-(NSString *)titleForCard: (Card *)card {
    return card.isChosen ? card.contents : nil;
}

-(UIImage *)backgroundImageForCard: (Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"card front" : @"card back"];
}

@end
