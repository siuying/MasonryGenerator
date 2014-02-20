//
//  View+Generator.h
//  MasonryGenerator
//
//  Created by Francis Chong on 2/21/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "Masonry.h"

@interface MAS_VIEW (Generator)

- (NSString*)mas_generateConstraintStrings:(void(^)(MASConstraintMaker *make))block;

@end
