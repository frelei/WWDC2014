//
//  Voice.h
//  move
//
//  Created by Rodrigo Freitas Leite on 25/01/14.
//  Copyright (c) 2014 Gambiarra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RFLVoice : NSObject

#pragma mark - Properties
@property(nonatomic) float rate;
@property(nonatomic) float volume;
@property(nonatomic) UITextView *textView;

#pragma mark - Methods
-(void) speechMessage:(NSString *) message;
-(void) setLanguage:(NSString*) language;
-(float) maxVolume;
-(float) minVolume;
-(float) maxRate;
-(float) minRate;
-(void) stopTalking;

@end
