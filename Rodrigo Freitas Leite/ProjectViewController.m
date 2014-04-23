//
//  ProjectViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 10/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectData.h"
#import "UIColor+CustomColors.h"
#import "VideoViewController.h"

@interface ProjectViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *projects;

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
    
    // Create Projects
    ProjectData *BombermanProject = [[ProjectData alloc] initWithTitle:@"Bomberman Sponge Head"
                                                          withSubtitle:@"Game"
                                                       withDescription:@"Game development using javascript and three.js"];
    
    ProjectData *moveSafeProject = [[ProjectData alloc] initWithTitle:@"Move Safe"
                                                  withSubtitle:@"Social"
                                               withDescription:@"Helping people to avoid car and running over accidents"];
    
    ProjectData *OzProject = [[ProjectData alloc] initWithTitle:@"Oz Engine"
                                                       withSubtitle:@"Light Engine"
                                                    withDescription:@"Personal Project, Development of a light engine in objective-c"];
    
    self.projects = @[BombermanProject, moveSafeProject, OzProject];
    [self.tableView setBackgroundColor: [UIColor MyDarkGray]];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.projects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProjectData *projectData = self.projects[indexPath.row];
    static NSString *CellIdentifier = @"IdentifireCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = projectData.title;
    cell.detailTextLabel.text = projectData.description;
    cell.detailTextLabel.numberOfLines = 2;
    cell.textLabel.textColor =  [UIColor MyPaleYellow];
    cell.detailTextLabel.textColor = [UIColor MyPaleYellow];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;

    if (indexPath.row % 2  == 0)
        cell.backgroundColor = [UIColor MyLightGray];
    else
        cell.backgroundColor =  [UIColor MyLighterGray];
    
    return cell;
}


#pragma mark - AcessoryButton tapped
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    ProjectData *projectData = self.projects[indexPath.row];
    [self performSegueWithIdentifier:@"goToVideo" sender:projectData];
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ProjectData *projectData = sender;
    if ([[segue identifier] isEqualToString:@"goToVideo"])
    {
        VideoViewController *video = [segue destinationViewController];
        if ([projectData.title isEqualToString:@"Bomberman Sponge Head"])
        {
            video.videoTitle =@"Bomberman";
            video.videoExtention=@"m4v";
        }
        
        if ([projectData.title isEqualToString:@"Move Safe"])
        {
            video.videoTitle =@"movesafe";
            video.videoExtention=@"m4v";
        }
        
        if ([projectData.title isEqualToString:@"Oz Engine"])
        {
            video.videoTitle =@"OZ";
            video.videoExtention=@"mov";
        }
    }
}



@end
