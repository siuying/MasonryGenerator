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
@property (nonatomic, weak) MAS_VIEW *installedView;
@property (nonatomic, weak) MASLayoutConstraint *layoutConstraint;
@property (nonatomic, assign) NSLayoutRelation layoutRelation;
@property (nonatomic, assign) MASLayoutPriority layoutPriority;
@property (nonatomic, assign) CGFloat layoutMultiplier;
@property (nonatomic, assign) CGFloat layoutConstant;
@property (nonatomic, assign) BOOL hasLayoutRelation;
@property (nonatomic, strong) id mas_key;
@property (nonatomic, assign) BOOL useAnimator;
+ (NSString *)descriptionForObject:(id)obj;
@end

@implementation MASViewConstraint (Generator)

-(NSString*) constraintString {
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
    
    [constraint appendFormat:@"[%@ addConstraint:[NSLayoutConstraint constraintWithItem:%@\n", [MASViewConstraint descriptionForObject:installedView], [MASViewConstraint descriptionForObject:firstLayoutItem]];
    [constraint appendFormat:@"                                               attribute:%@\n", firstLayoutAttributeString];
    [constraint appendFormat:@"                                               relatedBy:%@\n", relationString];
    [constraint appendFormat:@"                                                  toItem:%@\n", [MASViewConstraint descriptionForObject:secondLayoutItem]];
    [constraint appendFormat:@"                                               attribute:%@\n", secondLayoutAttributeString];
    [constraint appendFormat:@"                                              multiplier:%.1f\n", self.layoutMultiplier];
    [constraint appendFormat:@"                                              multiplier:%.1f]];\n", self.layoutConstant];
    return constraint;
}

@end
