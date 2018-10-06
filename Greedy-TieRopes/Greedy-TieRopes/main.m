//
//  main.m
//  Greedy-TieRopes
//
//  Created by Angel Ricardo on 6/5/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(int K, NSMutableArray *A) {
    // write your code in Objective-C 2.0
    int totalRopes = 0;
    int sumLength = 0;
    int lastIteration = 0;
    for (int i=0; i<A.count; i++) {
        sumLength += [A[i] intValue];
        if (sumLength >= K) {
            sumLength = 0;
            totalRopes++;
            lastIteration = i+1;
            
        }
        
    }
    
    return totalRopes;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
