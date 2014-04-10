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
@property (weak, nonatomic) IBOutlet UILabel *labelView;
@property (weak, nonatomic) IBOutlet UIButton *personalPage;

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

- (IBAction)pushButton:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"goToWeb" sender:nil];

}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ( [[segue identifier] isEqualToString:@"goToWeb"])
    {
        WebViewController *web = [segue destinationViewController];
        web.url = self.personalPage.currentTitle;
    }
}


@end
