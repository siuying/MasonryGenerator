# Masonry Generator

A Mansory extension to generate native NSLayoutConstraint code from Mansory code.

## Why?

Sometime I want to write constraints code easily but I dont want to add another 
dependency (such as writing a library). Generating native constraints can be 
handy.

## Usage

Import MansoryGenerator:

```objective-c
#import "MasonryGenerator.h"
```

Then add following line before your layout code:

```objective-c
[MasonryGenerator install];
```

Now any ``mas_makeConstraints:`` or ``mas_updateConstraints:`` calls will print
the native constraints code on console.

```objective-c
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

[view1 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding + 20);
    make.left.equalTo(superview.mas_left).offset(padding);
    make.bottom.equalTo(view3.mas_top).offset(-padding);
    make.right.equalTo(view2.mas_left).offset(-padding);
    make.width.equalTo(view2.mas_width);
    
    make.height.equalTo(view2.mas_height);
    make.height.equalTo(view3.mas_height);
}];
```

Following code will be generated on console:

```objective-c
=====================================================
[superview addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                         toItem:superview
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1.0
                                                       constant:30.0]];

[superview addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                      attribute:NSLayoutAttributeLeft
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:superview
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0
                                                       constant:10.0]];

[superview addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                      attribute:NSLayoutAttributeBottom
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:view3
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1.0
                                                       constant:-10.0]];

[superview addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                      attribute:NSLayoutAttributeRight
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:view2
                                                      attribute:NSLayoutAttributeLeft
                                                     multiplier:1.0
                                                       constant:-10.0]];

[superview addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:view2
                                                      attribute:NSLayoutAttributeWidth
                                                     multiplier:1.0
                                                       constant:0.0]];

[superview addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                      attribute:NSLayoutAttributeHeight
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:view2
                                                      attribute:NSLayoutAttributeHeight
                                                     multiplier:1.0
                                                       constant:0.0]];

[superview addConstraint:[NSLayoutConstraint constraintWithItem:view1
                                                      attribute:NSLayoutAttributeHeight
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:view3
                                                      attribute:NSLayoutAttributeHeight
                                                     multiplier:1.0
                                                       constant:0.0]];
=====================================================
```

Masonry Generator find the views name by mas_key field, so always set the mas_key to
the name of the view.

**Important: You should only include MansoryGenerator during development!**

## License

MIT License.