//
//  main.m
//  TimeComplexity-FrogJmp
//
//  Created by Angel Ricardo on 23/08/15.
//  Copyright © 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(int X, int Y, int D) {
    
    BOOL isDivisible = (Y - X) % D == 0 ? YES : NO;
    if (isDivisible)
        return  (Y - X) / D;
    else
        return ((Y - X) / D) + 1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
