//
//  MASConstraintMaker+Generator.m
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "MASConstraintMaker+Generator.h"
#import "MASViewConstraint+Generator.h"
#import "MASConstraint+Generator.h"

@interface MASConstraintMaker (Private) <MASConstraintDelegate>
@property (nonatomic, weak) MAS_VIEW *view;
@property (nonatomic, strong) NSMutableArray *constraints;
@end

@implementation MASConstraintMaker (Generator)

-(NSString*) generate {
    NSArray *constraints = self.constraints.copy;
    NSMutableArray* generatedStrings = [NSMutableArray array];
    for (MASConstraint *constraint in constraints) {
        [generatedStrings addObject:[constraint generate]];
    }
    return [generatedStrings componentsJoinedByString:@"\n"];
}

@end
