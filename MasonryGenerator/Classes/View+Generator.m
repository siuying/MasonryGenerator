//
//  View+Generator.m
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "View+Generator.h"
#import "MASConstraintMaker+Generator.h"

@implementation MAS_VIEW (Generator)

- (NSString*)mas_generateConstraintStrings:(void(^)(MASConstraintMaker *make))block {
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithView:self];
    block(constraintMaker);
    NSString* constraints = [constraintMaker generate];
    NSLog(@"=====================================================\n%@\n"
          @"=====================================================", constraints);
    return constraints;
}

@end
