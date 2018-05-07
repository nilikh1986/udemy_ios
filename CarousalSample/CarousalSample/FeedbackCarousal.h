//
//  FeedbackCarousal.h
//  CarousalSample
//
//  Created by Patnayak, Nilikh on 2/23/18.
//  Copyright © 2018 Patnayak, Nilikh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface FeedbackCarousal : UIView <iCarouselDelegate, iCarouselDataSource>


@property (nonatomic, weak) IBOutlet iCarousel *carousal;


@end
