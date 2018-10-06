//
//  main.m
//  ObjC-TimeComplexity-TapeEquilibrium
//
//  Created by Angel Ricardo on 23/08/15.
//  Copyright © 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A) {
    
    if (!A || A.count <= 1) return 0;
    
    int result = INT_MAX;
    int n = (int)A.count;
    NSMutableArray *leftSumArray = [[NSMutableArray alloc] initWithCapacity:n-1];
    NSMutableArray *rightSumArray = [[NSMutableArray alloc] initWithCapacity:n-1];
    int leftSumCurrentValue = 0;
    int rightSumCurrentValue = 0;
    
    for (int i=0; i<n; i++)
    {
        leftSumCurrentValue += [A[i] intValue];
        rightSumCurrentValue += [A[n-i-1] intValue];
        NSNumber *newLeftNumber = [NSNumber numberWithInt:leftSumCurrentValue];
        NSNumber *newRightNumber = [NSNumber numberWithInt:rightSumCurrentValue];
        [leftSumArray addObject:newLeftNumber];
        [rightSumArray insertObject:newRightNumber atIndex:0];
    }
    
    [leftSumArray removeLastObject];
    [rightSumArray removeObjectAtIndex:0];
    
    for (int i=0; i<n-1; i++)
    {
        int currentDifference = abs([leftSumArray[i] intValue] - [rightSumArray[i] intValue]);
        if (currentDifference < result)
            result = currentDifference;
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
