//
//  MASViewConstraint+Generator.m
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "MASViewConstraint+Generator.h"
#import "IGMasonryGeneratorHelper.h"
#import "View+MASAdditions.h"

@interface MASViewConstraint (Private)
@property (nonatomic, strong, readwrite) MASViewAttribute *secondViewAttribute;
@property (nonatomic, weak) MASLayoutConstraint *layoutConstraint;
@property (nonatomic, assign) NSLayoutRelation layoutRelation;
@property (nonatomic, assign) MASLayoutPriority layoutPriority;
@property (nonatomic, assign) CGFloat layoutMultiplier;
@property (nonatomic, assign) CGFloat layoutConstant;
@property (nonatomic, strong) id mas_key;
+ (NSString *)descriptionForObject:(id)obj;
@end

@implementation MASViewConstraint (Generator)

+ (NSString *)instanceDescriptionForObject:(id)obj {
    if ([obj respondsToSelector:@selector(mas_key)] && [obj mas_key]) {
        return [NSString stringWithFormat:@"%@", [obj mas_key]];
    }
    return [NSString stringWithFormat:@"%@", [obj class]];
}

-(NSString*) generate {
    NSMutableString* constraint = [[NSMutableString alloc] init];

    MAS_VIEW *firstLayoutItem = self.firstViewAttribute.view;
    NSLayoutAttribute firstLayoutAttribute = self.firstViewAttribute.layoutAttribute;
    NSString* firstLayoutAttributeString   = [IGMasonryGeneratorHelper layoutAttributeNames][@(firstLayoutAttribute)] ?: @"0";
    MAS_VIEW *secondLayoutItem = self.secondViewAttribute.view;
    NSLayoutAttribute secondLayoutAttribute = self.secondViewAttribute.layoutAttribute;
    NSString* secondLayoutAttributeString   = [IGMasonryGeneratorHelper layoutAttributeNames][@(secondLayoutAttribute)] ?: @"0";
    NSString* relationString = [IGMasonryGeneratorHelper layoutRelationNames][@(self.layoutRelation)] ?: @"0";

    MAS_VIEW *installedView;
    if (secondLayoutItem) {
        MAS_VIEW *closestCommonSuperview = [firstLayoutItem mas_closestCommonSuperview:secondLayoutItem];
        NSAssert(closestCommonSuperview,
                 @"couldn't find a common superview for %@ and %@",
                 firstLayoutItem, secondLayoutItem);
        installedView = closestCommonSuperview;
    } else {
        installedView = firstLayoutItem;
    }
    
    NSString* installedViewName = [MASViewConstraint instanceDescriptionForObject:installedView];
    NSString* firstLayoutItemName = [MASViewConstraint instanceDescriptionForObject:firstLayoutItem];
    NSString* secondLayoutItemName = [MASViewConstraint instanceDescriptionForObject:secondLayoutItem];
    NSString* indent = [self spaceWithLength:[installedViewName length]];

    [constraint appendFormat:@"[%@ addConstraint:[NSLayoutConstraint constraintWithItem:%@\n", installedViewName, firstLayoutItemName];
    [constraint appendFormat:@"                                             %@attribute:%@\n", indent, firstLayoutAttributeString];
    [constraint appendFormat:@"                                             %@relatedBy:%@\n", indent, relationString];
    [constraint appendFormat:@"                                                %@toItem:%@\n", indent, secondLayoutItemName];
    [constraint appendFormat:@"                                             %@attribute:%@\n", indent, secondLayoutAttributeString];
    [constraint appendFormat:@"                                            %@multiplier:%.1f\n", indent, self.layoutMultiplier];
    [constraint appendFormat:@"                                              %@constant:%.1f]];\n", indent, self.layoutConstant];

    return constraint;
}

- (NSString*) spaceWithLength:(NSUInteger)length {
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i ++) {
        [array addObject:@" "];
    }
    return [array componentsJoinedByString:@""];
}

@end
