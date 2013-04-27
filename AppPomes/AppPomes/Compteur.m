//
//  Compteur.m
//  AppPomes
//
//  Created by Yanaël Barbier on 26/04/13.
//  Copyright (c) 2013 Yanaël Barbier. All rights reserved.
//

#import "Compteur.h"

@implementation Compteur

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //Initialisation du compteur
        compteurPompes = [[NSNumber alloc]initWithInt:0];
        
        //Initialisation de la vue
        self.backgroundColor = [UIColor colorWithRed:0.682353 green:0.933333 blue:0 alpha:1];
        
        labCompteur = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        [labCompteur setCenter:self.center];
        [labCompteur setText:@"Poser le smartphone au sol et toucher l'écran avec votre nez à chaque pompe réalisé."];
        [labCompteur setNumberOfLines:5];
        labCompteur.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:30];
        labCompteur.backgroundColor = [UIColor clearColor];
        [labCompteur setTextColor:[UIColor whiteColor]];
        [labCompteur setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:labCompteur];
        
        UITapGestureRecognizer *tapCompteur = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addPompesTap:)];
        [self addGestureRecognizer:tapCompteur];
        
        UISwipeGestureRecognizer *swipeCompteur = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(quitCompteur:)];
        swipeCompteur.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:swipeCompteur];
    }
    return self;
}

- (void)addPompesTap:(UITapGestureRecognizer *)recognizer
{
    if(labCompteur.text.integerValue == 0)
        labCompteur.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:200];
    else if (labCompteur.text.integerValue == 999)
        labCompteur.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:150];
//    labCompteur.adjustsFontSizeToFitWidth = TRUE;
    
    compteurPompes = [NSNumber numberWithInt:[compteurPompes intValue]+1];
    labCompteur.text = [NSString stringWithFormat:@"%i",[compteurPompes intValue]];
    NSLog(@"Pompes: %i",[compteurPompes intValue]);
}

- (void)quitCompteur:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"Quit compteur");
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
