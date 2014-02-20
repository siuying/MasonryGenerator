//
//  MASCompositeConstraint+Generator.m
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "MASCompositeConstraint+Generator.h"

#import "MASConstraint+Generator.h"
#import "MASViewConstraint+Generator.h"
#import "IGMasonryGeneratorHelper.h"
#import "View+MASAdditions.h"
#import "NSLayoutConstraint+MASDebugAdditions.h"

@interface MASCompositeConstraint () <MASConstraintDelegate>
@property (nonatomic, strong) id mas_key;
@property (nonatomic, strong) NSMutableArray *childConstraints;
@end

@implementation MASCompositeConstraint (Generator)

-(NSString*) generate {
    NSMutableArray* generatedStrings = [NSMutableArray array];
    for (MASConstraint *constraint in self.childConstraints) {
        [generatedStrings addObject:[constraint generate]];
    }
    return [generatedStrings componentsJoinedByString:@"\n"];
}
@end
