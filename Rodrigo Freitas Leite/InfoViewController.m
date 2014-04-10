//
//  InfoViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 06/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "InfoViewController.h"
#import "UIColor+CustomColors.h"

@interface InfoViewController ()


@property (nonatomic) UIDynamicAnimator *animator;

@property (nonatomic) UIGravityBehavior *gravityBehavior;
@property (nonatomic) UIAttachmentBehavior *attachBehaviorOne;
@property (nonatomic) UIAttachmentBehavior *attachBehaviorTwo;
@property (nonatomic) UISnapBehavior *snapBehavior;
@property (nonatomic) UISnapBehavior *snapBehaviorDown;

@property (weak, nonatomic) IBOutlet UIButton *project;
@property (weak, nonatomic) IBOutlet UIButton *contact;
@property (weak, nonatomic) IBOutlet UIButton *education;


@end

@implementation InfoViewController
{
    CGPoint outBottomPoint;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Information"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.education.center = CGPointMake(-10, -10);
    self.project.center = CGPointMake(-10, -80);
    self.contact.center = CGPointMake(-10, -150);
    [self.animator removeBehavior:self.snapBehaviorDown];
    [self.animator addBehavior:self.attachBehaviorOne];
    [self.animator addBehavior:self.attachBehaviorTwo];
    [self.animator addBehavior:self.gravityBehavior];
    [self.animator addBehavior:self.snapBehavior];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Attributes of Strings titles
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0
                                         green:0.0
                                          blue:0.0
                                         alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor MyPaleYellow],
                                 NSShadowAttributeName : shadow,
                                 NSShadowAttributeName : [UIFont fontWithName:@"HelveticaNeue-CondensedBlack"
                                                                         size:25.0]
                                 };
    NSAttributedString *educationTitle = [[NSAttributedString alloc] initWithString:@"Education" attributes:attributes];
    
    NSAttributedString *projectTitle = [[NSAttributedString alloc] initWithString:@"Projects" attributes:attributes];
   
    NSAttributedString *contactTitle = [[NSAttributedString alloc] initWithString:@"Contact" attributes:attributes];
    
    [self.education setAttributedTitle:educationTitle forState:UIControlStateNormal];
    
    [self.project setAttributedTitle:projectTitle forState:UIControlStateNormal];
    
     [self.contact setAttributedTitle:contactTitle forState:UIControlStateNormal];

    // Define a incial region to buttons
    outBottomPoint = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height + 100);
    
   // Configure Behaviors
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.project, self.contact]];
    gravity.gravityDirection = CGVectorMake(0.0, 7.0);
    UIAttachmentBehavior *attachmentOne = [[UIAttachmentBehavior alloc] initWithItem:self.education
                                                                      attachedToItem:self.project];
    UIAttachmentBehavior *attachmentTwo = [[UIAttachmentBehavior alloc] initWithItem:self.project
                                                                      attachedToItem:self.contact];
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.education
                                                            snapToPoint:CGPointMake(self.view.center.x, self.view.center.y /1.6)];
  
    UISnapBehavior *snapBehaviorDown = [[UISnapBehavior alloc] initWithItem:self.education snapToPoint:outBottomPoint];
    
    snapBehaviorDown.damping = 4.0;
    snapBehavior.damping = 4.0;
    
    self.animator = animator;
    self.attachBehaviorOne = attachmentOne;
    self.attachBehaviorTwo = attachmentTwo;
    self.snapBehavior = snapBehavior;
    self.gravityBehavior = gravity;
    self.snapBehaviorDown = snapBehaviorDown;
}



- (IBAction)pushButton:(UIButton *)sender
{
//    [self.animator removeAllBehaviors];
  //  [self.animator removeBehavior:self.gravityBehavior];
    [self.animator removeBehavior: self.snapBehavior];
    [self.animator addBehavior:self.snapBehaviorDown];
    self.education.center = CGPointMake(-10, -10);
    self.project.center = CGPointMake(-10, -80);
    self.contact.center = CGPointMake(-10, -150);

    if (sender.tag == 0)
    {
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self
                                       selector:@selector(nextView:) userInfo:@"goToEducation" repeats:NO];
    }else if(sender.tag == 1)
    {
      //  [self performSegueWithIdentifier:@"goToProject" sender:nil];
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self
                                       selector:@selector(nextView:) userInfo:@"goToProject" repeats:NO];
    }else if(sender.tag == 2)
    {
     //   [self performSegueWithIdentifier:@"goToContact" sender:nil];
        [NSTimer scheduledTimerWithTimeInterval:0.5
                                         target:self
                                       selector:@selector(nextView:) userInfo:@"goToContact" repeats:NO];
    }

}

-(void) nextView:(NSTimer*) timer
{
    [self performSegueWithIdentifier:timer.userInfo
                              sender:nil];

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
