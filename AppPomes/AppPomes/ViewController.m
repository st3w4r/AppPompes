//
//  ViewController.m
//  AppPomes
//
//  Created by Yanaël Barbier on 23/04/13.
//  Copyright (c) 2013 Yanaël Barbier. All rights reserved.
//

#import "ViewController.h"

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
    [btnCommencer setBackgroundColor:[UIColor colorWithRed:0.0 green:1.0 blue:0.4 alpha:1.0]];
    [btnCommencer setTitle:@"Commencer" forState:UIControlStateNormal];
    [btnCommencer addTarget:self action:@selector(btnHandleMethode:) forControlEvents:UIControlEventTouchUpInside];
    
    //Bouton Réglage
    btnReglage = [UIButton buttonWithType:UIButtonTypeCustom];
    btnReglage.frame = CGRectMake(0.0, btnCommencer.frame.size.height, self.view.frame.size.width, (self.view.frame.size.height/10));
    [btnReglage setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]];
    [btnReglage setTitle:@"Réglages" forState:UIControlStateNormal];
    [btnReglage addTarget:self action:@selector(btnHandleMethode:) forControlEvents:UIControlEventTouchUpInside];
    
    //Bouton stat
    btnStats = [UIButton buttonWithType:UIButtonTypeCustom];
    btnStats.frame = CGRectMake(0.0, btnCommencer.frame.size.height + btnReglage.frame.size.height, self.view.frame.size.width, (self.view.frame.size.height - (btnCommencer.frame.size.height + btnReglage.frame.size.height)));
    [btnStats setBackgroundColor:[UIColor colorWithRed:0.1 green:1.0 blue:1.0 alpha:1.0]];
    [btnStats setTitle:@"Statistiques" forState:UIControlStateNormal];

    [btnStats addTarget:self action:@selector(btnHandleMethode:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnCommencer];
    [self.view addSubview:btnReglage];
    [self.view addSubview:btnStats];
}

- (void)btnHandleMethode:(UIButton*)sender
{
//    UIButton *button = (UIButton*)sender;
    [sender setSelected:![sender isSelected]];
//    [button setHighlighted:![button isHighlighted]];
    if (sender.selected == true)
    {
        [sender setAlpha:0.6];
    }
    else
    {
        [sender setAlpha:1.0];
    }
    
    NSLog(@"%@",sender.titleLabel.text);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
