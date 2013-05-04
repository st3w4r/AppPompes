//
//  Compteur.h
//  AppPomes
//
//  Created by Yanaël Barbier on 26/04/13.
//  Copyright (c) 2013 Yanaël Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Compteur : UIView{

    UILabel *labCompteur;
    NSNumber *compteurPompes;
    
    UILabel *labTimer;
    NSTimer *refreshTimer;
    NSNumber *leTimer;
    NSNumber *leTimerInterval;
}

@end