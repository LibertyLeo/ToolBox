//
//  FlatColors.m
//
//  Created by Leo_Lei on 6/12/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "FlatColors.h"

@implementation UIColor (FlatColors)

+ (UIColor *)colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B {
    return [self colorWithRed:(R / 255.0f)
                        green:(G / 255.0f)
                         blue:(B / 255.0f)
                        alpha:1.0];
}

+ (UIColor *)flatTurquoiseColor {
    return [self colorWithR:26 G:188 B:156];
}

+ (UIColor *)flatMidTurquoiseColor {
    return [self colorWithR:22 G:160 B:133];
}

+ (UIColor *)flatEmeraldColor {
    return [self colorWithR:46 G:204 B:113];
}

+ (UIColor *)flatEucalyptusColor {
    return [self colorWithR:39 G:174 B:96];
}

+ (UIColor *)flatNavyColor {
    return [self colorWithR:52 G:152 B:219];
}

+ (UIColor *)flatCuriousBlueColor {
    return [self colorWithR:41 G:128 B:185];
}

+ (UIColor *)flatAmethystColor {
    return [self colorWithR:155 G:89 B:182];
}

+ (UIColor *)flatWisteriaColor {
    return [self colorWithR:142 G:68 B:173];
}

+ (UIColor *)flatWetAsphaltColor {
    return [self colorWithR:52 G:73 B:94];
}

+ (UIColor *)flatMidnightBlueColor {
    return [self colorWithR:44 G:62 B:80];
}

+ (UIColor *)flatSunFlowerColor {
    return [self colorWithR:241 G:196 B:15];
}

+ (UIColor *)flatOrangeColor {
    return [self colorWithR:243 G:156 B:18];
}

+ (UIColor *)flatCarrotColor {
    return [self colorWithR:230 G:126 B:34];
}

+ (UIColor *)flatPumpkinColor {
    return [self colorWithR:211 G:84 B:0];
}

+ (UIColor *)flatCarminePinkColor {
    return [self colorWithR:231 G:76 B:60];
}

+ (UIColor *)flatPomegranateColor {
    return [self colorWithR:192 G:57 B:43];
}

+ (UIColor *)flatCloudsColor {
    return [self colorWithR:236 G:240 B:241];
}

+ (UIColor *)flatSilverColor {
    return [self colorWithR:189 G:195 B:199];
}

+ (UIColor *)flatConcreteColor {
    return [self colorWithR:149 G:165 B:166];
}

+ (UIColor *)flatAsbestosColor {
    return [self colorWithR:127 G:140 B:141];
}

@end
