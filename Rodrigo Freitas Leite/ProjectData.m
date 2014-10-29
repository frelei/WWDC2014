//
//  ProjectData.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 11/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "ProjectData.h"

@implementation ProjectData


-(id) initWithTitle:(NSString*)title withSubtitle:(NSString*)subtitle withDescription:(NSString*)description
{
    self = [super init];
    if (self)
    {
        _title = title;
        _subtitle = subtitle;
        description = description;
    }
    return self;
}

@end
