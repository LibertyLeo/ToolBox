//
//  Path.m
//
//  Created by Leo_Lei on 7/19/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "Path.h"

@implementation Path

// Model持有path对象
- (void)setPath:(CGMutablePathRef)path {
    if (_path != path) {
        CGPathRelease(_path);
        CGPathRetain(path);
        _path = path;
    }
}

// Model销毁之前对path进行一次释放操作
- (void)dealloc {
    CGPathRelease(_path);
}

@end
