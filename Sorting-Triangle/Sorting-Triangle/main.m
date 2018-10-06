//
//  main.m
//  Sorting-Triangle
//
//  Created by Angel Ricardo on 5/22/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSMutableArray *A) {
    
    if (A == nil) return 0;
    if (A.count < 3) return 0;
    
    NSArray *sortedArray = [A sortedArrayUsingSelector:@selector(compare:)];
    
    for(int i=0; i<sortedArray.count - 2; i++)
    {
        if (sortedArray[i] < 0 || sortedArray[i+1] < 0 || sortedArray[i+2] < 0)
            continue;
        
        long long numP = [sortedArray[i] intValue];
        long long numQ = [sortedArray[i+1] intValue];
        long long numR = [sortedArray[i+2] intValue];
        
        if (numP + numQ > numR && numQ + numR > numP && numR + numP > numQ)
            return 1;
    }
    
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
