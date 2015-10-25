//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "PlayingCardDeck.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PlayingCardDeck *deck;
@property (nonatomic) int countTurns;

@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (weak, nonatomic) IBOutlet UILabel *countTurnsLabel;

@end

@implementation ViewController

- (PlayingCardDeck *)deck {
	if (!_deck) {
		_deck = [[PlayingCardDeck alloc] init];
	}
    
    Card *card1 = [[Card alloc] init];
    card1.contents = @"2♣";
    
    Card *card2 = [[Card alloc] init];
    card2.contents = @"22♣";
    
	return _deck;
}


- (IBAction)cardButtonTapped:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
		[sender setTitle:@""
				forState:UIControlStateNormal];
		[sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
						  forState:UIControlStateNormal];
	} else {
		
        if (self.deck.deckIsEmpty) {
            return;
        }
        
        Card *card = [self.deck drawRandomCard];
		[sender setTitle:card.contents
                forState:UIControlStateNormal];
        
        [sender setTitleColor:card.getColor forState:UIControlStateNormal];
        
		[sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
						  forState:UIControlStateNormal];
	}
    
    NSString *strFromInt = [NSString stringWithFormat:@"%d",++self.countTurns];
    self.countTurnsLabel.text = strFromInt;
    
}
- (IBAction)cardButtonTappedLog:(UIButton *)sender {
    if (![sender.currentTitle length]) {
        NSLog(@"Card was flipped");
    }
    
    if (self.deck.deckIsEmpty) {
        NSLog(@"Deck is Empty");
    }
}

@end
