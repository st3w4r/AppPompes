//
//  ViewController.h
//  AppPomes
//
//  Created by Yanaël Barbier on 23/04/13.
//  Copyright (c) 2013 Yanaël Barbier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Compteur.h"

@class Compteur;
@class Statistiques;

@interface ViewController : UIViewController
{
    Compteur *_compteur;
    Statistiques *_statistiques;
    UIView *laVuePrincipal;
}

@end

