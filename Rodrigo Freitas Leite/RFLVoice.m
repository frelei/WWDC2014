//
//  Voice.m
//  move
//
//  Created by Rodrigo Freitas Leite on 25/01/14.
//  Copyright (c) 2014 Gambiarra. All rights reserved.
//

#define MIN_VOLUME 0
#define MAX_VOLUME 1

#import <AVFoundation/AVFoundation.h>
#import "RFLVoice.h"
#import "UIColor+CustomColors.h"

@interface RFLVoice () <AVSpeechSynthesizerDelegate>

@property(nonatomic) AVSpeechSynthesisVoice * voice;
@property(nonatomic) AVSpeechUtterance *utterance;
@property(nonatomic) AVSpeechSynthesizer *synthesizer;
@property(nonatomic) NSString *message;

@end

@implementation RFLVoice

#pragma mark - Delegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.message];

    [text addAttribute:NSFontAttributeName
                 value:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]
                 range:NSMakeRange(0, [self.message length])];

    [text addAttribute:NSForegroundColorAttributeName value:[UIColor MyPaleYellow] range:NSMakeRange(0, [self.message length])];
    [text addAttribute:NSBackgroundColorAttributeName value:[UIColor MyRed] range:characterRange];
    
     
    if (self.textView != nil){
        self.textView.attributedText = text;
    }
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    self.message = nil;
    self.textView = nil;
}


#pragma mark - Inicilizadores
- (id)init
{
    self = [super init];
    if (self)
    {
        self.voice =  [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
        self.synthesizer = [[AVSpeechSynthesizer alloc] init];
        self.rate = 0.13;
        self.volume = 1.0;
        self.synthesizer.delegate = self;
        self.textView = nil;
    }
    return self;
}

-(void) stopTalking
{
    [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}


-(void) setLanguage:(NSString*) language
{
    self.voice =  [AVSpeechSynthesisVoice voiceWithLanguage:language];
}


-(void) speechMessage:(NSString *) message
{
    self.message = message;
    self.utterance = [[AVSpeechUtterance alloc] initWithString:message];
    self.utterance.rate = self.rate;
    self.utterance.volume = self.volume;
    self.utterance.voice = self.voice;
    if (!self.synthesizer.isSpeaking)
        [self.synthesizer speakUtterance:self.utterance];
}


#pragma mark - Getters e Setters

-(void)setRate:(float)rate
{
    if (rate >= AVSpeechUtteranceMaximumSpeechRate)
        _rate = AVSpeechUtteranceMaximumSpeechRate;
    else if(rate <= AVSpeechUtteranceMinimumSpeechRate)
        _rate = AVSpeechUtteranceMinimumSpeechRate;
    else
        _rate = rate;
    self.utterance.rate = _rate;
}

-(void) setVolume:(float)volume
{
    if (volume >= MAX_VOLUME)
        _volume = MAX_VOLUME;
    else if (volume <= MIN_VOLUME)
        _volume = MIN_VOLUME;
    else
        _volume = volume;
    self.utterance.volume = _volume;
}

-(float) maxVolume
{
    return MAX_VOLUME;
}

-(float) minVolume
{
    return MIN_VOLUME;
}
-(float) maxRate
{
    return AVSpeechUtteranceMaximumSpeechRate;
}
-(float) minRate
{
    return AVSpeechUtteranceMinimumSpeechRate;
}
@end
