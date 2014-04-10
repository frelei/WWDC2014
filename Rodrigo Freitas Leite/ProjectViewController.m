//
//  ProjectViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 10/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "ProjectViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Projects"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
