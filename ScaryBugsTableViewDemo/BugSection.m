//
//  BugSection.m
//  ScaryBugsTableViewDemo
//
//  Created by VKS on 3/25/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "BugSection.h"

@implementation BugSection

- (instancetype)initWithHowScary:(ScaryFactor)howScary { if ((self = [super init])) {
    _howScary = howScary;
    _bugs = [NSMutableArray array]; }
    return self;
}

@end
