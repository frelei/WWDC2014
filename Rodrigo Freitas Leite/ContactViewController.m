//
//  ContactViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 10/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "ContactViewController.h"
#import "UIColor+CustomColors.h"
#import "WebViewController.h"

@interface ContactViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ContactViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Contact"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ImageView BorderCorners
    self.imageView.layer.cornerRadius = 20;
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.imageView.layer.borderWidth = 1.0;
}


@end
