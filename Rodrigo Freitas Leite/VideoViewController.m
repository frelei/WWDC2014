//
//  VideoViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 11/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@property(nonatomic) MPMoviePlayerController *moviePlayer;

@end

@implementation VideoViewController


-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Project"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    NSString *videoFile = [[NSBundle mainBundle] pathForResource:self.videoTitle ofType:self.videoExtention];
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: [NSURL fileURLWithPath:videoFile]];
    [self.view addSubview:self.moviePlayer.view];
    self.moviePlayer.fullscreen = YES;
    self.moviePlayer.allowsAirPlay = YES;
    [self.moviePlayer play];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Exit From video
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doneButtonClick:)
                                                 name:MPMoviePlayerWillExitFullscreenNotification
                                               object:nil];

}


-(void) doneButtonClick:(NSNotification*) aNotification
{
    [self.moviePlayer stop];
    self.moviePlayer = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
