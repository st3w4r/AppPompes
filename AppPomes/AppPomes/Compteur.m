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
        leTimer = [[NSNumber alloc] initWithFloat:0];
        
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
        
        labTimer = [[UILabel alloc] initWithFrame:CGRectMake(0 , 0, 100, 50)];
        [labTimer setCenter:CGPointMake(self.center.x, labCompteur.frame.origin.y+30)];
        [labTimer setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:30]];
        [labTimer setTextColor:[UIColor whiteColor]];
        [labTimer setBackgroundColor:[UIColor clearColor]];
        [labTimer setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:labTimer];
        
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
    
    NSLog(@"Temps: %.2f",[leTimerInterval floatValue]);
    leTimerInterval = [[NSNumber alloc]initWithFloat:0];

    [refreshTimer invalidate];
    refreshTimer = nil;
    refreshTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(temps:) userInfo:nil repeats:YES];
//    [intervalTimer initWithFireDate:[NSDate date] interval:1 target:self selector:@selector(temps:) userInfo:nil repeats:YES];
//    intervalTimer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(temps:) userInfo:nil repeats:YES];
}

- (void)quitCompteur:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"Quit compteur");
    [refreshTimer invalidate];
    refreshTimer = nil;
    
  	[UIView animateWithDuration:0.7 animations:^{
        [self setFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    }];

    [self performSelector:@selector(suppVue:) withObject:self afterDelay:0.7];

}

- (void)suppVue:(UIView *)uneVue
{
    [uneVue removeFromSuperview];
}
     
- (void)temps:(id)sender
{
    leTimerInterval = [NSNumber numberWithFloat:[leTimerInterval floatValue]+0.01];
    leTimer = [NSNumber numberWithFloat:[leTimer floatValue]+0.01];
    
    [labTimer setText:[NSString stringWithFormat:@"%.1f",[leTimer floatValue]]];
    
//    NSLog(@"Temps Ecoulé: %f",[leTimerInterval floatValue]);
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
