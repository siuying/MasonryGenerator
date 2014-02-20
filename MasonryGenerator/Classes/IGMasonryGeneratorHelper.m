//
//  IGMasonryGeneratorHelper.m
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "IGMasonryGeneratorHelper.h"

@implementation IGMasonryGeneratorHelper

+ (NSDictionary *)layoutRelationNames {
    static dispatch_once_t once;
    static NSDictionary *descriptionMap;
    dispatch_once(&once, ^{
        descriptionMap = @{
                           @(NSLayoutRelationEqual)                : @"NSLayoutRelationEqual",
                           @(NSLayoutRelationGreaterThanOrEqual)   : @"NSLayoutRelationGreaterThanOrEqual",
                           @(NSLayoutRelationLessThanOrEqual)      : @"NSLayoutRelationLessThanOrEqual",
                           };
    });
    return descriptionMap;
}

+ (NSDictionary *)layoutAttributeNames {
    static dispatch_once_t once;
    static NSDictionary *descriptionMap;
    dispatch_once(&once, ^{
        descriptionMap = @{
                           @(NSLayoutAttributeTop)      : @"NSLayoutAttributeTop",
                           @(NSLayoutAttributeLeft)     : @"NSLayoutAttributeLeft",
                           @(NSLayoutAttributeBottom)   : @"NSLayoutAttributeBottom",
                           @(NSLayoutAttributeRight)    : @"NSLayoutAttributeRight",
                           @(NSLayoutAttributeLeading)  : @"NSLayoutAttributeLeading",
                           @(NSLayoutAttributeTrailing) : @"NSLayoutAttributeTrailing",
                           @(NSLayoutAttributeWidth)    : @"NSLayoutAttributeWidth",
                           @(NSLayoutAttributeHeight)   : @"NSLayoutAttributeHeight",
                           @(NSLayoutAttributeCenterX)  : @"NSLayoutAttributeCenterX",
                           @(NSLayoutAttributeCenterY)  : @"NSLayoutAttributeCenterY",
                           @(NSLayoutAttributeBaseline) : @"NSLayoutAttributeBaseline",
                           };
        
    });
    return descriptionMap;
}

@end
