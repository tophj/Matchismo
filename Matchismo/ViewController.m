//
//  ViewController.m
//  Matchismo
//
//  Created by Chris Jones on 6/16/14.
//  Copyright (c) 2014 Chris Jones. All rights reserved.
//

#import "ViewController.h"

#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()


@property(nonatomic, strong) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController

-(CardMatchingGame *)game{
    if(!_game){
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
    
}


-(Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)touchCardButton:(UIButton *)sender {
    

    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
    
}

-(IBAction)touchNewGameButton:(UIButton *)sender{
    
    [self flipCardsOver];
    [self.game startNewGame];
    
}

-(void)flipCardsOver{
    
    for(UIButton * cardButton in self.cardButtons){
        
        cardButton.enabled = YES;
        [cardButton setTitle:[NSString stringWithFormat:@""] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardBack"] forState:UIControlStateNormal];
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
//        [self.game ]
        
    }
}

-(void) updateUI{
    
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",[self.game score]];
}
-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen? @"cardFront" : @"cardBack"];
}

@end
