//
//  MapViewController.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 10/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;
@property (nonatomic) MKPointAnnotation *point;

@end

@implementation MapViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"Location"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    if ([self.place isEqualToString:@"UFRGS"])
    {
        self.point = [[MKPointAnnotation alloc] init];
        [self.point setTitle:@"UFRGS"];
        [self.point setCoordinate: CLLocationCoordinate2DMake(-30.07647354, -51.12467408)];
        [self.mapView addAnnotation:self.point];
        MKCoordinateRegion viewRegion = MKCoordinateRegionMake(self.point.coordinate, MKCoordinateSpanMake(0.01, 0.01));
        [_mapView setRegion:viewRegion animated:YES];
    }
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
