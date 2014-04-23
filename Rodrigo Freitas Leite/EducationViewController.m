//
//  EducationViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 10/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "EducationViewController.h"
#import "MapViewController.h"
#import "WebViewController.h"

@interface EducationViewController ()



@end

@implementation EducationViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Education"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)pushButton:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        [self performSegueWithIdentifier:@"goToWeb" sender:nil];
    }else if (sender.tag == 1)
    {
        [self performSegueWithIdentifier:@"goToMap" sender:nil];
    }

}

 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     if ( [[segue identifier] isEqualToString:@"goToWeb"])
     {
         WebViewController *web = [segue destinationViewController];
         web.url = @"http://inf.ufrgs.br";
     }
     if ( [[segue identifier] isEqualToString:@"goToMap"])
     {
         MapViewController *map = [segue destinationViewController];
         map.place = @"UFRGS";
     }
     
    
 }





@end
