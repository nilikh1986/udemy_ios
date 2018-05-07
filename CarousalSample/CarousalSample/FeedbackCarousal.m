//
//  FeedbackCarousal.m
//  CarousalSample
//
//  Created by Patnayak, Nilikh on 2/23/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

#import "FeedbackCarousal.h"
#import "Question.h"


@interface FeedbackCarousal()

@property (nonatomic, strong) NSArray *questionArray;
    
@end


@implementation FeedbackCarousal

-(void)awakeFromNib {
    [super awakeFromNib];
    
    Question *qu1 = [[Question alloc] initWithType:@"Radio" question:@"This is ques1"];
    Question *qu2 = [[Question alloc] initWithType:@"YesNo" question:@"This is ques2"];
    Question *qu3 = [[Question alloc] initWithType:@"Radio" question:@"This is ques3"];
    Question *qu4 = [[Question alloc] initWithType:@"Radio" question:@"This is ques4"];
    Question *qu5 = [[Question alloc] initWithType:@"YesNo" question:@"This is ques5"];
    Question *qu6 = [[Question alloc] initWithType:@"Input" question:@"This is ques6"];
    
    self.questionArray = [[NSArray alloc] initWithObjects:qu1, qu2, qu3, qu6, qu4, qu5,nil];
    
    //self.carousal.type = iCarouselTypeCoverFlow2;
    self.carousal.type = iCarouselTypeCustom;
    self.carousal.delegate = self;
    self.carousal.dataSource = self;
    //self.carousal.scrollEnabled = NO;
    
    
    
}


- (IBAction)nextButtonTapped:(id)sender {
    
    NSLog(@"Next tapped!");
    NSInteger currentIndex = self.carousal.currentItemIndex;
    [self.carousal scrollToItemAtIndex:currentIndex+1 animated:true];
    
}


-(CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {
    const CGFloat offsetFactor = [self carousel:carousel valueForOption:iCarouselOptionSpacing withDefault:1.0f]*carousel.itemWidth;
    
    //The larger these values, as the items move away from the center ...
    
    //... the faster they move to the back
    const CGFloat zFactor = 150.0f;
    
    //... the faster they move to the bottom of the screen
    const CGFloat normalFactor = 50.0f;
    
    //... the faster they shrink
    const CGFloat shrinkFactor = 1.0f;
    
    //hyperbola
    CGFloat f = sqrtf(offset*offset+1)-1;
    
    transform = CATransform3DTranslate(transform, offset*offsetFactor, 1, 1);
    transform = CATransform3DScale(transform, 1/(f/shrinkFactor+1.0f), 1/(f/shrinkFactor+1.0f), 1.0);
    return transform;
}



- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.questionArray.count;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    Question *currentQuestion = self.questionArray[index];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.textAlignment = UITextAlignmentCenter;
    lable.text = currentQuestion.questionText;
    if ([currentQuestion.questionType isEqualToString:@"Radio"]) {
        lable.backgroundColor = [UIColor redColor];
    } else if([currentQuestion.questionType isEqualToString:@"YesNo"]) {
        lable.backgroundColor = [UIColor brownColor];
    } else {
        lable.backgroundColor = [UIColor yellowColor];
    }
    
    
    lable.text = [NSString stringWithFormat:@"%@", currentQuestion.questionText];
    
    lable.frame = CGRectMake(0, 0, self.carousal.frame.size.width * 0.8f, 240);
    return lable;
}


@end
