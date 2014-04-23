//
//  MenuViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 05/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "MenuViewController.h"
#import "KnowMeViewController.h"
#import "RFLVoice.h"
#import "UIColor+CustomColors.h"

@interface MenuViewController ()

@property (nonatomic) RFLVoice *voice;
@property (nonatomic) UIDynamicAnimator *animator;

//Gravities Behaviors
@property (nonatomic) UIGravityBehavior *gravityBehavior;
@property (nonatomic) UIGravityBehavior *gravityBehaviorLeft;
@property (nonatomic) UIGravityBehavior *gravityBehaviorRight;
@property (nonatomic) UICollisionBehavior *collision;
@property (nonatomic) UIAttachmentBehavior *attachBehavior;

@property (weak, nonatomic) IBOutlet UIView *elastic;
@property (strong, nonatomic) IBOutlet UIImageView *myFace;
@property (weak, nonatomic) IBOutlet UIView *ceiling;

@property (nonatomic) UIAttachmentBehavior *attachBehaviorInfo;
@property (weak, nonatomic) IBOutlet UIView *elasticInfo;
@property (weak, nonatomic) IBOutlet UIImageView *myInfo;

@property (nonatomic) NSArray *views;
@property  (nonatomic) NSArray *elastics;
@property(nonatomic) NSArray *behaviors;

@end

@implementation MenuViewController
{
    CGPoint myFaceCenter;
    CGPoint myInfoCenter;
    CGRect elasticFrame;
    CGRect elasticInfoFrame;
    BOOL isActiveBehavior;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self addAllBehaviors];
    isActiveBehavior = YES;
 
}


- (void)viewDidLoad
{
    // Corner of photo
    self.myFace.layer.cornerRadius = 20;
    self.myFace.clipsToBounds = YES;
    self.myFace.layer.borderColor = [UIColor MyRed].CGColor;
    self.myFace.layer.borderWidth = 1.0;
    
    self.myInfo.layer.cornerRadius = 20;
    self.myInfo.clipsToBounds = YES;
    self.myInfo.layer.borderColor = [UIColor MyRed].CGColor;
    self.myInfo.layer.borderWidth = 1.0;
    
    // Define inicial center and frame of elastic
    myFaceCenter = self.myFace.center;
    myInfoCenter = self.myInfo.center;
    elasticFrame = self.elastic.frame;
    elasticInfoFrame = self.elasticInfo.frame;
    
    // define gravities
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.myFace, self.myInfo]];
    [gravity setGravityDirection:CGVectorMake(0.0, 1.0)];
    UIGravityBehavior *gravityLeft = [[UIGravityBehavior alloc] initWithItems:@[self.myFace, self.myInfo]];
    [gravityLeft setGravityDirection:CGVectorMake(-0.5, 0.0)];
    UIGravityBehavior *gravityRight = [[UIGravityBehavior alloc] initWithItems:@[self.myFace, self.myInfo]];
    [gravityRight setGravityDirection:CGVectorMake(0.5, 0.0)];
    
    // define Collision
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.myFace, self.myInfo]];
    [collision addBoundaryWithIdentifier:@"LEFT"
                               fromPoint:CGPointMake(0.0, 0.0)
                                 toPoint:CGPointMake(0.0, self.view.frame.size.height)];
    [collision addBoundaryWithIdentifier:@"RIGHT"
                               fromPoint:CGPointMake(self.view.frame.size.width,0.0)
                                 toPoint:CGPointMake(self.view.frame.size.width, self.view.frame.size.height)];
    
    [collision  setCollisionMode:UICollisionBehaviorModeEverything];
    
    // define Attachments
    UIAttachmentBehavior *attachment = [self createAttachmentBehaviorWithItem:self.myFace
                                                                   withAnchor:self.ceiling
                                                                  withElastic:self.elastic];
    
    UIAttachmentBehavior *attachmentInfo = [self createAttachmentBehaviorWithItem:self.myInfo
                                                                   withAnchor:self.ceiling
                                                                  withElastic:self.elasticInfo];
    
    // Starting Dynamic Animator
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.animator = animator;
    self.gravityBehavior = gravity;
    self.gravityBehaviorLeft = gravityLeft;
    self.gravityBehaviorRight = gravityRight;
    self.collision = collision;
    self.attachBehavior = attachment;
    self.attachBehaviorInfo = attachmentInfo;
    
    // All Behaviors in Array
    self.behaviors = @[self.collision, self.gravityBehavior, self.attachBehavior, self.attachBehaviorInfo];
    
    // Put All Views in Array;
    self.views = @[self.myFace, self.myInfo];
    self.elastics = @[self.elastic, self.elasticInfo];
    
    // Apresentation And Voice Configuration
    self.voice = [[RFLVoice alloc] init];
    [self.voice speechMessage:@"Hi, my name is Rodrigo, welcome to my app."];
    
}

#pragma mark - Behaviors

///////////////////////////////////////////////
// Configure Custom AttachmentBehavior
-(UIAttachmentBehavior*) createAttachmentBehaviorWithItem:(UIImageView*) item
                                               withAnchor:(UIView*) anchor
                                              withElastic:(UIView*) elastic
{
    CGPoint point = CGPointMake(elastic.center.x, anchor.center.y);
    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:point];
    
    attachment.length = 200;
    [attachment setFrequency:1.0];
    [attachment setDamping:0.3];
    
    // Set spring distance everytime behavior happened
    attachment.action = ^{
        CGRect frame = elastic.frame;
        frame.size.height = item.frame.origin.y - frame.origin.y + 10;
       
        if ( 1.5 > ABS(elastic.frame.origin.x - elasticFrame.origin.x))
        {
            if (frame.size.width < elasticFrame.size.width)
            {
                frame.size.width += 0.3;
                frame.origin = elasticFrame.origin;
            }
        }
        
        if (  1.5 > ABS(elastic.frame.origin.x - elasticInfoFrame.origin.x))
        {
            if (frame.size.width < elasticInfoFrame.size.width)
            {
                frame.size.width += 0.3;
                frame.origin = elasticInfoFrame.origin;
            }
        }
        elastic.frame = frame;
    };
    return attachment;
}

///////////////////////////////////////
// Configure and Create a PushBehavior
-(UIPushBehavior*) createPushBehaviorWithItem:(UIImageView*) item
                                withDirection:(CGVector) vector
                                   withOffSet:(UIOffset) offset
{
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[item]
                                                                    mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.pushDirection = vector;
    [pushBehavior setTargetOffsetFromCenter:offset forItem:item];
    return pushBehavior;
}


-(void) addAllBehaviors
{
    for (UIDynamicBehavior *d in self.behaviors){
        [self.animator addBehavior:d];
    }
}


/////////////////////////////////////
// Select Touch View
-(UIImageView*) selectView:(CGPoint)point
{
    UIImageView *v = nil;
    for (UIImageView *view in self.views)
    {
        if (
             point.x < (view.center.x + view.frame.size.width / 2.0) &&
             point.x > (view.center.x - view.frame.size.width / 2.0) &&
             point.y < (view.center.y + view.frame.size.height / 2.0) &&
             point.y > (view.center.y - view.frame.size.height / 2.0)
           )
        {
            v = view;
            break;
        }
    }
    return v;
}


/////////////////////////////////
// Tap in the screen, animated
- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    // Implements animation when touch
}


/////////////////////////////////////////////////////////
// Dragging the ImageView
// Remove all behaviors and move the view based in the user touch
// Configure the elastic width as user pull

- (IBAction)Dragging:(UIPanGestureRecognizer *)gesture
{
    CGPoint pointInView = [gesture locationInView:self.view];
    UIImageView *imageView = [self selectView:pointInView];
    if (imageView != nil)
    {
        // Remove Behaviors
        if (gesture.state == UIGestureRecognizerStateBegan)
        {
            [self.animator removeAllBehaviors];
            isActiveBehavior = NO;
        }
            // Move in the screen ImageView
        else if (gesture.state == UIGestureRecognizerStateChanged)
        {
          if (self.ceiling.frame.size.height  + imageView.frame.size.height / 2.0 <  pointInView.y )
            {
                // Set Elastic  Heigth
                imageView.center = CGPointMake(imageView.center.x, pointInView.y);
                UIView *tempElastic = self.elastics[[self.views indexOfObject:imageView]];
                CGRect frame  = tempElastic.frame;
                frame.size.height = imageView.frame.origin.y - frame.origin.y + 10;
              
                // Set Elastic Width
                if (imageView.center.y >= myFaceCenter.y)
                {
                    if ( 1.5 > ABS(frame.origin.x - elasticFrame.origin.x) && frame.size.width > 0.8)
                    {
                        frame.size.width -= 0.3;
                        frame.origin = elasticFrame.origin;
                    }
                }
                
                if (imageView.center.y >= myInfoCenter.y)
                {
                    if ( 1.5 > ABS(frame.origin.x - elasticInfoFrame.origin.x) &&  frame.size.width > 0.8)
                    {
                        frame.size.width -= 0.3;
                        frame.origin = elasticInfoFrame.origin;
                    }
                }
            
                tempElastic.frame = frame;
            }
            
        }
        else if (gesture.state == UIGestureRecognizerStateEnded)
        {
            // ImageView put in the bottom from user, go to next view
            if (pointInView.y > self.view.frame.size.height - imageView.frame.size.height * 2.0)
            {
                // Remove all the Elastics
                [UIView animateWithDuration:0.5 animations:^{
                    for (UIImageView *v in self.elastics)
                    {
                        CGRect frame = v.frame;
                        frame.size.height = 0.0;
                        frame.size.width = elasticInfoFrame.size.width;
                        v.frame = frame;
                    }
                }];
            
                // Add Gravity and push behavior
                [self.animator addBehavior:self.gravityBehavior];
                UIPushBehavior *pushBehavior = [self createPushBehaviorWithItem:imageView
                                                                  withDirection:CGVectorMake(0.0, -2.8)
                                                                     withOffSet:UIOffsetMake(10, 10)];
                [self.animator addBehavior:pushBehavior];
                
                // send the UIVIew in the target
                [NSTimer scheduledTimerWithTimeInterval:1.4
                                                 target:self
                                               selector:@selector(animeToNextView:)
                                               userInfo:imageView
                                                repeats:NO];
            
            }
            else
            {
                [self addAllBehaviors];
                isActiveBehavior = YES;
            }
        }
    }
    else
    {   // The finger out the view need add the behavior again
        [self addAllBehaviors];
        isActiveBehavior = YES;
    }
}


#pragma mark - Timers

////////////////////////////////////////////////
// Anime View to the next action after some time
-(void) animeToNextView:(NSTimer*)timer
{
    [self.animator removeAllBehaviors];
    // based on tag, go to the specific view
    UIImageView *imageView = [timer userInfo];
    if (imageView.tag == 0)
       [self performSegueWithIdentifier:@"goToKnowMe" sender:nil];
    if (imageView.tag == 1)
        [self performSegueWithIdentifier:@"goToInformation" sender:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(putImageInPlace:) userInfo:nil repeats:NO];
}


-(void) putImageInPlace:(NSTimer*)timer
{
    self.myFace.center = myFaceCenter;
    self.myInfo.center = myInfoCenter;
}

-(void) removeAllGravity
{
    [self.animator removeBehavior:self.gravityBehaviorLeft];
    [self.animator removeBehavior:self.gravityBehaviorRight];

}



@end
