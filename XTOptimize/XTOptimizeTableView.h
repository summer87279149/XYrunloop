//
//  XTOptimizeTableView.h
//
//  Created by Admin on 2017/5/15.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (XTCategory)

+(NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)()) block repeats:(BOOL)repeat;

@end

typedef void(^TaskBlock)(void);

@interface XTOptimizeTableView : NSObject

@property (nonatomic, assign) NSUInteger maxQueueLength;

-(instancetype)initWithMaxQueueLength:(NSUInteger)length;

-(void)addTask:(TaskBlock)task;

@end
