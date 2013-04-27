//
//  ViewController.m
//  AppPomes
//
//  Created by Yanaël Barbier on 23/04/13.
//  Copyright (c) 2013 Yanaël Barbier. All rights reserved.
//

#import "ViewController.h"
#import "Compteur.h"

@interface ViewController ()
    
@end


@implementation ViewController

UIButton *btnCommencer;
UIButton *btnReglage;
UIButton *btnStats;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *msg = @"Hello World";
    NSLog(@"%@",msg);
    
    //Bouton commencer

    btnCommencer = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCommencer.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height/2);
    [btnCommencer setBackgroundColor:[UIColor colorWithRed:0.682353 green:0.933333 blue:0 alpha:1]];
    [btnCommencer setTitle:@"Commencer" forState:UIControlStateNormal];
    [btnCommencer addTarget:self action:@selector(btnHandleMethode:) forControlEvents:UIControlEventTouchUpInside];
    [btnCommencer setTag:1];
    btnCommencer.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:35];
    
    //Bouton Réglage
    btnReglage = [UIButton buttonWithType:UIButtonTypeCustom];
    btnReglage.frame = CGRectMake(0.0, btnCommencer.frame.size.height, self.view.frame.size.width, (self.view.frame.size.height/10));
    [btnReglage setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1]];
    [btnReglage setTitle:@"Réglages" forState:UIControlStateNormal];
    [btnReglage addTarget:self action:@selector(btnHandleMethode:) forControlEvents:UIControlEventTouchUpInside];
    [btnReglage setTag:2];
    btnReglage.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:35];
    
    //Bouton stat
    btnStats = [UIButton buttonWithType:UIButtonTypeCustom];
    btnStats.frame = CGRectMake(0.0, btnCommencer.frame.size.height + btnReglage.frame.size.height, self.view.frame.size.width, (self.view.frame.size.height - (btnCommencer.frame.size.height + btnReglage.frame.size.height)));
    [btnStats setBackgroundColor:[UIColor colorWithRed:0.00392157 green:0.690196 blue:0.941176 alpha:1.0]];
    [btnStats setTitle:@"Statistiques" forState:UIControlStateNormal];
    [btnStats addTarget:self action:@selector(btnHandleMethode:) forControlEvents:UIControlEventTouchUpInside];
    [btnStats setTag:3];
    btnStats.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:35];
    
    [self.view addSubview:btnCommencer];
    [self.view addSubview:btnReglage];
    [self.view addSubview:btnStats];
    
}

- (void)btnHandleMethode:(id)sender
{
    UIButton *button = (UIButton*)sender;
    [sender setSelected:![sender isSelected]];
//    [button setHighlighted:![button isHighlighted]];
    if (button.selected == true)
    {
        [button setAlpha:0.6];
    }
    else
    {
        [button setAlpha:1.0];
    }
    
    if (button.tag == 1)
    {
        [self afficherCompteur];
    }
    
    NSLog(@"Button: %@",button.titleLabel.text);
    NSLog(@"Tag: %d",button.tag);
    
}

- (void)afficherCompteur
{
    _compteur = [[Compteur alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_compteur];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
