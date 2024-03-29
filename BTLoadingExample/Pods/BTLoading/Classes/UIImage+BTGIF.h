//
//  UIImage+GIF.h
//  LBGIFImage
//
//  Created by Laurin Brandner on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BTGIF)

+ (UIImage *)animatedGIFNamed:(NSString *)name bundle:(NSBundle*)b;

+ (UIImage *)animatedGIFWithData:(NSData *)data;

- (UIImage *)animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end

