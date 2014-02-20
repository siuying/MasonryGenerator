//
//  IGViewController.m
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "IGViewController.h"
#import "Masonry.h"
#import "MasonryGenerator.h"

@interface IGViewController ()

@end

@implementation IGViewController

- (void)loadView
{
    [super loadView];

    UIView *superview = self.view;
    superview.mas_key = @"superview";

    UIView *view1 = UIView.new;
    view1.mas_key = @"view1";
    view1.backgroundColor = UIColor.greenColor;
    view1.layer.borderColor = UIColor.blackColor.CGColor;
    view1.layer.borderWidth = 2;
    [superview addSubview:view1];
    
    UIView *view2 = UIView.new;
    view2.mas_key = @"view2";
    view2.backgroundColor = UIColor.redColor;
    view2.layer.borderColor = UIColor.blackColor.CGColor;
    view2.layer.borderWidth = 2;
    [superview addSubview:view2];
    
    UIView *view3 = UIView.new;
    view3.mas_key = @"view3";
    view3.backgroundColor = UIColor.blueColor;
    view3.layer.borderColor = UIColor.blackColor.CGColor;
    view3.layer.borderWidth = 2;
    [superview addSubview:view3];
    
    int padding = 10;

    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding + 20);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(view3.mas_top).offset(-padding);
        make.right.equalTo(view2.mas_left).offset(-padding);
        make.width.equalTo(view2.mas_width);
        
        make.height.equalTo(view2.mas_height);
        make.height.equalTo(view3.mas_height);
    }];

    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding + 20); //with with
        make.left.equalTo(view1.mas_right).offset(padding); //without with
        make.bottom.equalTo(view3.mas_top).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.width.equalTo(view1.mas_width);
        
        make.height.equalTo(@[view1, view3]); //can pass array of views
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.height.equalTo(@[view1.mas_height, view2.mas_height]); //can pass array of attributes
    }];
    
    [view1 mas_generateConstraintStrings:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding + 20);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(view3.mas_top).offset(-padding);
        make.right.equalTo(view2.mas_left).offset(-padding);
        make.width.equalTo(view2.mas_width);
        
        make.height.equalTo(view2.mas_height);
        make.height.equalTo(view3.mas_height);
    }];
    
    [view2 mas_generateConstraintStrings:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding + 20); //with with
        make.left.equalTo(view1.mas_right).offset(padding); //without with
        make.bottom.equalTo(view3.mas_top).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.width.equalTo(view1.mas_width);
        
        make.height.equalTo(@[view1, view3]); //can pass array of views
    }];
    
    [view3 mas_generateConstraintStrings:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.height.equalTo(@[view1.mas_height, view2.mas_height]); //can pass array of attributes
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
