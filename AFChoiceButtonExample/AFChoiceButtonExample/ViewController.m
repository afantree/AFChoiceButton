//
//  ViewController.m
//  AFChoiceButtonExample
//
//  Created by 阿凡树( http://blog.afantree.com ) on 14-8-20.
//  Copyright (c) 2014年 ManGang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, 320, self.view.bounds.size.height-20)];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+200);
    [self.view addSubview:scrollView];
    
#pragma mark - radio
    UILabel *questionText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,280,20)];
    questionText.backgroundColor = [UIColor clearColor];
    questionText.text = @"1. Which color do you like?";
    [scrollView addSubview:questionText];
    
    AFChoiceButton* cButton1=[AFChoiceButton buttonWithFrame:CGRectMake(10,30,22,22) andChoiceType:AFChoiceTypeRadio withIndex:1 inGroup:@"radio" withSelectedImage:[UIImage imageNamed:@"selected.png"] andNormalImage:[UIImage imageNamed:@"cancel.png"]];
    cButton1.mustChooseOne=YES;
    cButton1.delegate=self;
    [scrollView addSubview:cButton1];
    AFChoiceButton* cButton2=[AFChoiceButton buttonWithFrame:CGRectMake(10,60,22,22) andChoiceType:AFChoiceTypeRadio withIndex:2 inGroup:@"radio" withSelectedImage:[UIImage imageNamed:@"selected.png"] andNormalImage:[UIImage imageNamed:@"cancel.png"]];
    cButton2.mustChooseOne=YES;
    cButton2.delegate=self;
    [scrollView addSubview:cButton2];
    AFChoiceButton* cButton3=[AFChoiceButton buttonWithFrame:CGRectMake(10,90,22,22) andChoiceType:AFChoiceTypeRadio withIndex:3 inGroup:@"radio" withSelectedImage:[UIImage imageNamed:@"selected.png"] andNormalImage:[UIImage imageNamed:@"cancel.png"]];
    cButton3.mustChooseOne=YES;
    cButton3.delegate=self;
    [scrollView addSubview:cButton3];
    
    UILabel *label1 =[[UILabel alloc] initWithFrame:CGRectMake(40, 30, 60, 20)];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = @"Red";
    [scrollView addSubview:label1];
    
    UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(40, 60, 60, 20)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = @"Green";
    [scrollView addSubview:label2];
    
    UILabel *label3 =[[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 20)];
    label3.backgroundColor = [UIColor clearColor];
    label3.text = @"Blue";
    [scrollView addSubview:label3];
#pragma mark - check
    UILabel *questionText2 = [[UILabel alloc] initWithFrame:CGRectMake(0,130,300,20)];
    questionText2.backgroundColor = [UIColor clearColor];
    [questionText2 setAdjustsFontSizeToFitWidth:YES];
    questionText2.text = @"2. 借问酒家何处有？";
    [scrollView addSubview:questionText2];
    
    AFChoiceButton* ccButton1=[AFChoiceButton buttonWithFrame:CGRectMake(10,160,22,22) andChoiceType:AFChoiceTypeCheck withIndex:1 inGroup:@"check" withSelectedImage:[UIImage imageNamed:@"selected.png"] andNormalImage:[UIImage imageNamed:@"cancel.png"]];
    ccButton1.delegate=self;
    [scrollView addSubview:ccButton1];
    AFChoiceButton* ccButton2=[AFChoiceButton buttonWithFrame:CGRectMake(10,190,22,22) andChoiceType:AFChoiceTypeCheck withIndex:2 inGroup:@"check" withSelectedImage:[UIImage imageNamed:@"selected.png"] andNormalImage:[UIImage imageNamed:@"cancel.png"]];
    ccButton2.delegate=self;
    [scrollView addSubview:ccButton2];
    AFChoiceButton* ccButton3=[AFChoiceButton buttonWithFrame:CGRectMake(10,220,22,22) andChoiceType:AFChoiceTypeCheck withIndex:3 inGroup:@"check" withSelectedImage:[UIImage imageNamed:@"selected.png"] andNormalImage:[UIImage imageNamed:@"cancel.png"]];
    ccButton3.delegate=self;
    [scrollView addSubview:ccButton3];
    
    UILabel *label11 =[[UILabel alloc] initWithFrame:CGRectMake(40, 160, 260, 20)];
    label11.backgroundColor = [UIColor clearColor];
    label11.text = @"牧童遥指杏花村。";
    [scrollView addSubview:label11];
    
    UILabel *label22 =[[UILabel alloc] initWithFrame:CGRectMake(40, 190, 260, 20)];
    label22.backgroundColor = [UIColor clearColor];
    label22.text = @"姑苏城外寒山寺。";
    [scrollView addSubview:label22];
    
    UILabel *label33 =[[UILabel alloc] initWithFrame:CGRectMake(40, 220, 260, 20)];
    label33.backgroundColor = [UIColor clearColor];
    label33.text = @"想和一杯板蓝根。";
    [scrollView addSubview:label33];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - AFChoiceButtonDelegate
-(void)choiceButtonCancelAtIndex:(NSUInteger)index inGroup:(NSString *)groupId
{
    NSLog(@"You cancel group:%@  index:%d",groupId,index);
}
-(void)choiceButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId
{
    NSLog(@"You selected group:%@  index:%d",groupId,index);
}
@end
