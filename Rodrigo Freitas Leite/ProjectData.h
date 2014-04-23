//
//  ProjectData.h
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Leite on 11/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectData : NSObject

@property NSString *title;
@property NSString *subtitle;
@property NSString *description;

-(id) initWithTitle:(NSString*)title withSubtitle:(NSString*)subtitle withDescription:(NSString*)description;

@end
