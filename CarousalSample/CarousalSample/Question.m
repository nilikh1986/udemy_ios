//
//  Question.m
//  CarousalSample
//
//  Created by Patnayak, Nilikh on 2/23/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithType:(NSString *)type question:(NSString *)question
{
    self = [super init];
    if (self) {
        self.questionType = type;
        self.questionText = question;
    }
    return self;
}

@end
