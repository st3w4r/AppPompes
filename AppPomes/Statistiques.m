//
//  Statistiques.m
//  AppPomes
//
//  Created by Yanaël Barbier on 03/05/13.
//  Copyright (c) 2013 Yanaël Barbier. All rights reserved.
//

#import "Statistiques.h"

@implementation Statistiques

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        self.backgroundColor = [UIColor colorWithRed:0.00392157 green:0.690196 blue:0.941176 alpha:1.0];

        //Ajout Gesture
        UISwipeGestureRecognizer *swipeCompteur = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(quitStatistiques:)];
        swipeCompteur.direction = UISwipeGestureRecognizerDirectionDown;
        [self addGestureRecognizer:swipeCompteur];
        
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/3)];
        scrollView.contentSize = CGSizeMake(self.frame.size.width*4, self.frame.size.height/3);
        scrollView.backgroundColor = [[UIColor darkGrayColor]initWithWhite:0.5 alpha:0.5];
        
        UIView *vueRecord = [[UIView alloc]initWithFrame:CGRectMake(0, scrollView.frame.size.height, self.frame.size.width , (self.frame.size.height-scrollView.frame.size.height)/3)];
        [vueRecord setBackgroundColor:[UIColor colorWithWhite:0.2 alpha:0.8]];
        UILabel *labRecord = [[UILabel alloc]initWithFrame:CGRectMake(0,0, vueRecord.frame.size.width, vueRecord.frame.size.height)];
        labRecord.backgroundColor = [UIColor clearColor];
        labRecord.textColor = [UIColor colorWithWhite:1 alpha:0.8];
        labRecord.textAlignment = NSTextAlignmentRight;
        labRecord.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:35];
        labRecord.text = @"RECORD: 52";
        [vueRecord addSubview:labRecord];
        
        UIView *vueMoyenne = [[UIView alloc]initWithFrame:CGRectMake(0, vueRecord.frame.origin.y+vueRecord.frame.size.height, self.frame.size.width , vueRecord.frame.size.height)];
        [vueMoyenne setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.6]];
        UILabel *labMoyenne = [[UILabel alloc]initWithFrame:CGRectMake(0,0, vueMoyenne.frame.size.width, vueMoyenne.frame.size.height)];
        labMoyenne.backgroundColor = [UIColor clearColor];
        labMoyenne.textColor = [UIColor colorWithWhite:1 alpha:0.8];
        labMoyenne.textAlignment = NSTextAlignmentRight;        
        labMoyenne.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:35];
        labMoyenne.text = @"MOYENNE: 35";
        [vueMoyenne addSubview:labMoyenne];
        
        UIView *vueTemps = [[UIView alloc]initWithFrame:CGRectMake(0, vueMoyenne.frame.origin.y+vueMoyenne.frame.size.height, self.frame.size.width , vueMoyenne.frame.size.height)];
        [vueTemps setBackgroundColor:[UIColor colorWithWhite:0.7 alpha:0.3]];
        UILabel *labTemps = [[UILabel alloc]initWithFrame:CGRectMake(0,0, vueTemps.frame.size.width, vueTemps.frame.size.height)];
        labTemps.backgroundColor = [UIColor clearColor];
        labTemps.textColor = [UIColor colorWithWhite:1 alpha:0.8];
        labTemps.textAlignment = NSTextAlignmentRight;
        labTemps.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:35];
        labTemps.text = @"TEMPS MOYEN: 1,37";
        [vueTemps addSubview:labTemps];
        
        
        [self addSubview:vueRecord];
        [self addSubview:vueMoyenne];
        [self addSubview:vueTemps];
        [self addVueScroll:52 aIndex:0];
        [self addVueScroll:103 aIndex:1];
        [self addVueScroll:130 aIndex:2];
        [self addVueScroll:30 aIndex:3];
        [self addVueScroll:15 aIndex:4];
        [self addVueScroll:20 aIndex:5];
        
//        [self addVueScroll:73 aIndex:2];
//        //Vue 1
//        UIView *uneVue = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 40, scrollView.frame.size.height-20)];
//        uneVue.backgroundColor = [UIColor whiteColor];
//        //Vue 2
//        UIView *uneVue2 = [[UIView alloc] initWithFrame:CGRectMake(80, 40, 40, scrollView.frame.size.height-40)];
//        uneVue2.backgroundColor = [UIColor whiteColor];
//        //Vue 3
//        uneVue3 = [[UIView alloc] initWithFrame:CGRectMake(140, 30, 40, scrollView.frame.size.height-30)];
//        uneVue3.backgroundColor = [UIColor whiteColor];
//        UITapGestureRecognizer *tapVue3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(voirVue:)];
//
//        [uneVue3 addGestureRecognizer:tapVue3];
//        
//        [scrollView addSubview:uneVue];
//        [scrollView addSubview:uneVue2];
//        [scrollView addSubview:uneVue3];
        
        [self addSubview:scrollView];
    }
    return self;
}

- (void)addVueScroll:(int)nbPompes aIndex:(int)unIndex
{
    
    unBouton = [[UIButton alloc] initWithFrame:CGRectMake(20+60*unIndex, scrollView.frame.size.height, 40, -nbPompes)];
    unBouton.backgroundColor = [UIColor whiteColor];
//    UITapGestureRecognizer *tapVue = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(voirVue:)];
//    [unBouton addGestureRecognizer:tapVue];
    [unBouton setTag:unIndex];
    [unBouton addTarget:self action:@selector(voirStat:) forControlEvents:UIControlEventTouchUpInside];
    [unBouton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [unBouton setTitle:[NSString stringWithFormat:@"%d",unIndex] forState:UIControlStateHighlighted];
    
//    [unBouton addTarget:self action:@selector(buttonColor:) forControlEvents:UIControlEventTouchDown];
//    [unBouton addTarget:self action:@selector(buttonColor:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:unBouton];
}

//-(void)buttonColor:(id)sender
//{
//    UIButton *boutton = sender;
//    if (boutton.backgroundColor == [UIColor darkGrayColor])
//            [boutton setBackgroundColor:[UIColor whiteColor]];
//    else
//        [boutton setBackgroundColor:[UIColor darkGrayColor]];
//}
- (void)voirStat:(id)sender
{
    UIButton *bouton = (UIButton *)sender;
    
    NSLog(@"%ld", (long)bouton.tag);
}

- (void)quitStatistiques:(UISwipeGestureRecognizer *)recognizer
{

  	[UIView animateWithDuration:0.7 animations:^{
        [self setFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    }];
    
    [self performSelector:@selector(suppVue:) withObject:self afterDelay:0.7];    
}

- (void)suppVue:(UIView *)uneVueStat
{
    [uneVueStat removeFromSuperview];
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
