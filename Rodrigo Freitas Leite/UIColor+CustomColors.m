//
//  UIColor+CustomColors.m
//  Rodrigo Freitas Leite
//
//  Created by Rodrigo Freitas Leite on 09/04/14.
//  Copyright (c) 2014 Frelei. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)


////////////////////////////
// My Default Colors System

+(UIColor*) MyRed
{
   return [[UIColor alloc] initWithRed:220/255.0 green:53/255.0 blue:71/255.0 alpha:1.0];
}
+(UIColor*) MyDarkGray
{
    return [[UIColor alloc] initWithRed:55/255.0 green:65/255.0 blue:64/255.0 alpha:1.0];
}

+(UIColor*) MyPaleYellow
{
    return [UIColor colorWithRed:217.0/255.0 green:203.0/255.0 blue:158.0/255.0 alpha:1.0];
}

+(UIColor*) MyLightGray
{
    return [UIColor colorWithRed:80/255.0 green:65/255.0 blue:64/255.0 alpha:0.8];
}

+(UIColor*) MyLighterGray
{
    return [UIColor colorWithRed:80/255.0 green:95/255.0 blue:94/255.0 alpha:1.0];

}


@end
