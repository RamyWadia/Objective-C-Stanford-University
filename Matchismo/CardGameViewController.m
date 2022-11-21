//
//  ViewController.m
//  Matchismo
//
//  Created by Ramy Atalla on 2022-11-20.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;

@end

@implementation CardGameViewController

// lazy deck intialization.
-(Deck *) deck {
    if (!_deck) _deck = [self createDeck];
    return _deck;
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

-(void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

// repeating the same line of code for self.flipCount++
// is not best practice, it would have been better if an
// algorithm created to fix that. also simplicity  and elegance
// are important so it is kinda what is the best balance. 
- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"card back"]
                      forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    } else {
        Card *card = [self.deck drawRandomCard];
        if (card) {
        [sender setBackgroundImage:[UIImage imageNamed:@"card front"]
                          forState:UIControlStateNormal];
        [sender setTitle:card.contents
                forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}

@end
