//
//  main.m
//  ObjC-DynamicProgramming-NumberSolitaire
//
//  Created by Angel Ricardo on 6/13/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A) {
    if (!A) return -1;
    if (A.count == 0) return -1;
    
    int n = A.count;
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:n];
    [result addObject:A[0]];
    
    int i;
    for (i=1; i<n; i++) {
        int biggestWeight = INT_MIN;
        for (int j=i-6; j<i; j++) {
            if (j < 0)
                continue;
            if (biggestWeight < [result[j] intValue] + [A[i] intValue]) {
                biggestWeight = [result[j] intValue] + [A[i] intValue];
            }
        }
        [result addObject:[NSNumber numberWithInt:biggestWeight]];
    }
    
    return [result[i-1] intValue];
}