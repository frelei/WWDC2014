//
//  WebViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 10/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation WebViewController


-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Site"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestURL];
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
