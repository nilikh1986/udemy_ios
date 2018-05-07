//
//  Question.h
//  CarousalSample
//
//  Created by Patnayak, Nilikh on 2/23/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *questionType;
@property (nonatomic, strong) NSString *questionText;

- (instancetype)initWithType:(NSString *)type question:(NSString *)question;

@end
