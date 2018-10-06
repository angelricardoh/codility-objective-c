//
//  main.m
//  Greedy-MaxNonoverlappingSegments
//
//  Created by Angel Ricardo on 6/5/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A, NSMutableArray *B) {
    int noIntersections = 0;
    int a = 0;
    int b = 0;
    int i = 1;
    int j = 1;
    
    a = [A[0] intValue];
    b = [B[0] intValue];
    
    BOOL hasIntersections = NO;
    while (i < A.count) {
        if (b < [A[i] intValue]) {
            noIntersections++;
            a = [A[i] intValue];
            b = [B[i] intValue];
            hasIntersections = YES;
        }
        i++;
        j++;
    }
    
    if (hasIntersections)
        return noIntersections + 1;
    return noIntersections;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
