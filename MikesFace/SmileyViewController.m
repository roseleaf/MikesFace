//
//  SmileyViewController.m
//  MikesFace
//
//  Created by Rose CW on 8/21/12.
//  Copyright (c) 2012 Rose CW. All rights reserved.
//

#import "SmileyViewController.h"
#import "SmileyView.h"

@interface SmileyViewController ()

@end

@implementation SmileyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SmileyView* smileview = [[SmileyView alloc]initWithFrame:self.view.frame];
    self.view = smileview;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
