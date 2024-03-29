//
//  BTLoadingSubView.m
//  BTLoadingTest
//
//  Created by zanyu on 2019/8/13.
//  Copyright © 2019 stonemover. All rights reserved.
//

#import "BTLoadingSubView.h"
#import "BTLoadingConfig.h"

@implementation BTLoadingSubView


- (void)initSubView{
    [self createLabel];
    [self createImg];
    [self createBtn];
}


- (void)createLabel{
    self.label=[[UILabel alloc]init];
    self.label.textAlignment=NSTextAlignmentCenter;
    self.label.numberOfLines=0;
//    self.label.text=self.loadingStr;
    self.label.translatesAutoresizingMaskIntoConstraints=NO;
    self.label.font=[UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    self.label.textColor=[UIColor colorWithRed:120/255.0 green:121/255.0 blue:122/255.0 alpha:1];
    [self addSubview:self.label];
    NSLayoutConstraint * centerY=[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-20];
    NSLayoutConstraint * left=[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:40];
    NSLayoutConstraint * right=[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeRight multiplier:1 constant:40];
    [self addConstraints:@[centerY,left,right]];
}

- (void)createImg{
    self.imgView=[[UIImageView alloc]init];
    [self addSubview:self.imgView];
    self.imgView.translatesAutoresizingMaskIntoConstraints=NO;
    NSLayoutConstraint * top=[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.imgView attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    
    NSLayoutConstraint * centerX=[NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    
    
    [self addConstraint:top];
    [self addConstraint:centerX];
    
}

- (void)createBtn{
    self.btn=[[UIButton alloc]init];
    self.btn.translatesAutoresizingMaskIntoConstraints=NO;
    self.btn.backgroundColor=[UIColor colorWithRed:106/255.0 green:179/255.0 blue:250/255.0 alpha:1];
    self.btn.layer.cornerRadius=8;
    self.btn.titleLabel.font=[UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    [self.btn setTitle:@"刷新" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(reloadClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btn];
    
    NSLayoutConstraint * top=[NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.label attribute:NSLayoutAttributeBottom multiplier:1 constant:35];
    
    NSLayoutConstraint * centerX=[NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint * x=[NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:110];
    NSLayoutConstraint * y=[NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:45];
    
    [self addConstraint:top];
    [self addConstraint:centerX];
    [self.btn addConstraint:x];
    [self.btn addConstraint:y];
}


- (void)reloadClick{
    if (self.clickBlock) {
        self.clickBlock();
    }
}


- (void)show:(NSString*)title img:(UIImage*)img{
    if (title) {
        self.label.text=title;
    }
    
    if (img) {
        self.imgView.image=img;
    }
}

@end
