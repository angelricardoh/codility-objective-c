//
//  main.m
//  CountingElements-FrogRiverOne
//
//  Created by Angel Ricardo on 24/08/15.
//  Copyright © 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(int X, NSMutableArray *A) {
    
    int n = (int)A.count;
    NSMutableDictionary *fallenLeavesDictionary = [[NSMutableDictionary alloc] initWithCapacity:n];
    int resultIndex = -1;
    BOOL lookUpLeaveHasFallen = NO;
    
    for(int i=0; i<n; i++) {
        
        if ([A[i] intValue] <= X) {
            [fallenLeavesDictionary setObject:@YES forKey:A[i]];
        }
        
        if ([A[i] intValue] == X) {
            resultIndex = i;
            lookUpLeaveHasFallen = YES;
        }
        
        if (lookUpLeaveHasFallen) {
            resultIndex = i;
            if (fallenLeavesDictionary.count == X) {
                return resultIndex;
            }
        }
    }
    
    return -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
