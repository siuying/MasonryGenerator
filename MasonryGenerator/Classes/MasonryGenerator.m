//
//  MasonryGenerator.m
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "MasonryGenerator.h"
#import "JRSwizzle.h"

@implementation MAS_VIEW (MasonryGenerator)

- (NSArray *)mas_makeConstraintsWithGenerator:(void(^)(MASConstraintMaker *make))block {
    [self mas_generateConstraintStrings:block];
    return [self mas_makeConstraintsWithGenerator:block];
}

- (NSArray *)mas_updateConstraintsWithGenerator:(void(^)(MASConstraintMaker *make))block {
    [self mas_generateConstraintStrings:block];
    return [self mas_updateConstraintsWithGenerator:block];
}

@end

@implementation MasonryGenerator

+(void) install
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [MAS_VIEW jr_swizzleMethod:@selector(mas_makeConstraints:) withMethod:@selector(mas_makeConstraintsWithGenerator:) error:nil];
        [MAS_VIEW jr_swizzleMethod:@selector(mas_updateConstraints:) withMethod:@selector(mas_updateConstraintsWithGenerator:) error:nil];
    });
}

@end
