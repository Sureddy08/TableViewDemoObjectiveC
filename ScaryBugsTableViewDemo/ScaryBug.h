//
//  ScaryBug.h
//  ScaryBugs
//
//  Created by VKS on 3/25/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ScaryFactor) {
  ScaryFactorNotScary,
  ScaryFactorALittleScary,
  ScaryFactorAverageScary,
  ScaryFactorQuiteScary,
  ScaryFactorAiiiiieeeee
};

@interface ScaryBug : NSObject

@property (strong) NSString * name;
@property (strong) UIImage * image;
@property (assign) ScaryFactor howScary;

- (id)initWithName:(NSString *)name image:(UIImage *)image howScary:(ScaryFactor)howScary;
- (NSString *)howScaryString;

+ (NSMutableArray *)bugs;
+ (NSString *)scaryFactorToString:(ScaryFactor)scaryFactor;

@end