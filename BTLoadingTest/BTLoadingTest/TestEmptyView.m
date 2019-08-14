//
//  TestEmptyView.m
//  BTLoadingTest
//
//  Created by zanyu on 2019/8/14.
//  Copyright © 2019 stonemover. All rights reserved.
//

#import "TestEmptyView.h"

@implementation TestEmptyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)initSubView{
    UILabel * label =[[UILabel alloc] init];
    label.text=@"empty";
    [label sizeToFit];
    [self addSubview:label];
    label.center=self.center;
}

- (void)show:(NSString *)title img:(UIImage *)img{
    
}

@end
