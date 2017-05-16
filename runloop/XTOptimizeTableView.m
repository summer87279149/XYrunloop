


//
//  XTOptimizeTableView.m
//  runloop测试
//
//  Created by Admin on 2017/5/15.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "XTOptimizeTableView.h"
@implementation NSTimer (XTCategory)
+(NSTimer *)eocScheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)()) block repeats:(BOOL)repeat{
    return  [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(startTimer:) userInfo:[block copy] repeats:repeat];
}
+(void)startTimer:(NSTimer *)timer{
    void(^block)() = timer.userInfo;
    if (block) {
        block();
    }
    
}
@end

@interface XTOptimizeTableView()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *tasks;
@property (nonatomic, copy) TaskBlock block;
@end


@implementation XTOptimizeTableView
-(instancetype)initWithMaxQueueLength:(NSUInteger)length{
    self = [self init];
    self.maxQueueLength = length;
    [self addRunLoopObserver];
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tasks = [NSMutableArray array];
    }
    return self;
}
void callback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    XTOptimizeTableView *vc = (__bridge XTOptimizeTableView *)info;
    if (vc.tasks.count==0) {
        return;
    }
    TaskBlock block = vc.tasks.firstObject;
    block();
    [vc.tasks removeObjectAtIndex:0];
}

-(void)addTask:(TaskBlock)task{
    [self.tasks addObject:task];
    if (self.tasks.count>self.maxQueueLength) {
        [self.tasks removeObjectAtIndex:0];
    }
}

-(void)addRunLoopObserver{
    _timer = [NSTimer eocScheduledTimerWithTimeInterval:0.001 block:^{
    } repeats:YES];
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    static CFRunLoopObserverRef defaultModeObserver;
    defaultModeObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopAfterWaiting, YES, 0, &callback, &context);
    CFRunLoopAddObserver(runloop, defaultModeObserver, kCFRunLoopDefaultMode);
    CFRelease(defaultModeObserver);
}
@end
