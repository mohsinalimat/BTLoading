//
//  ViewController.m
//  BTLoadingExample
//
//  Created by stonemover on 2019/1/20.
//  Copyright © 2019 stonemover. All rights reserved.
//

#import "ViewController.h"
#import "BTToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BTToast showSuccess:@"123"];
    });
}


@end
