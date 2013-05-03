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
        
//        UIDevice *device = [UIDevice alloc];
//        UIApplication *capteur = [UIApplication alloc];
        leTimerInterval = [[NSNumber alloc]initWithFloat:0];
        

        [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addPompesCapteur:) name:@"UIDeviceProximityStateDidChangeNotification" object:nil];

        
//        [device setProximityMonitoringEnabled:YES];
//
//        if ([device isProximityMonitoringEnabled])
//        {
//            NSLog(@"Capteur OK");
//        }
//        
//        if ([[UIDevice currentDevice] proximityState])
//        {
//            [self addPompes:[UIDevice currentDevice]];
//            NSLog(@"Test capteur de proximité");
//        }
//        

        
        
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
        [labTimer setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
        [labTimer setBackgroundColor:[UIColor clearColor]];
        [labTimer setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:labTimer];
        
        UITapGestureRecognizer *tapCompteur = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addPompes:)];
        [self addGestureRecognizer:tapCompteur];
        
        UISwipeGestureRecognizer *swipeCompteur = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(quitCompteur:)];
        swipeCompteur.direction = UISwipeGestureRecognizerDirectionUp;
        [self addGestureRecognizer:swipeCompteur];
    }
    return self;
}

- (void)addPompes:(id)recognizer
{
//    if (typeof(recognizer) == typeof(UITapGestureRecognizer) {
//        NSLog(@"Tap Gesture");
//    }
//    else if(typeof (recognizer) == typeof(UIDevice) ) {
//        NSLog(@"Capteur de proximité");
//    }

        
    
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

- (void)addPompesCapteur:(id)sender
{
    if ([leTimerInterval floatValue] >= 0.5)
    {
        [self addPompes:sender];
    }
    else
        NSLog(@"Interval trop court");
}

- (void)quitCompteur:(UISwipeGestureRecognizer *)recognizer
{
    NSLog(@"Quit compteur");
    [refreshTimer invalidate];
    refreshTimer = nil;

    [[UIDevice currentDevice] setProximityMonitoringEnabled:NO];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
  	[UIView animateWithDuration:0.7 animations:^{
        [self setFrame:CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height)];
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
