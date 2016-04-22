//
//  BugSection.h
//  ScaryBugsTableViewDemo
//
//  Created by VKS on 3/25/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScaryBug.h"

@interface BugSection : NSObject

@property (assign) ScaryFactor howScary;
@property (strong, nonatomic) NSMutableArray *bugs;

- (instancetype)initWithHowScary:(ScaryFactor)howScary;

@end
