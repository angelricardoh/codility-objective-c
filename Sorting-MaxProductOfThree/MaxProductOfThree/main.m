//
//  main.m
//  MaxProductOfThree
//
//  Created by Angel Ricardo on 5/12/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *b = [NSDictionary dictionaryWithObjectsAndKeys:@1, @"Hello", @2, @"Nice", nil];
        NSLog(@"%@2", b);
        NSArray *a = [NSArray arrayWithObjects:@-3, @1, @2, @-2, @5, @6, nil];
        NSLog(@"%d", solution(a));
    }
    return 0;
}

int solution(NSMutableArray *A) {
    // write your code in Objective-C 2.0
    if (A.count < 3) return -1;
    NSArray *sortedArray = [A sortedArrayUsingSelector:@selector(compare:)];
    int n = sortedArray.count;
    int biggestElement = [sortedArray[n-1] intValue];
    int secondBiggestElement = [sortedArray[n-2] intValue];
    int thirdBiggestElement = [sortedArray[n-3] intValue];
    int mostPossibleNegativeElement = [sortedArray[0] intValue];
    int secondMostPossibleNegativeElement = [sortedArray[1] intValue];
    
    int candidateResult = biggestElement * secondBiggestElement * thirdBiggestElement;
    int candidateResult2 = biggestElement * mostPossibleNegativeElement * secondMostPossibleNegativeElement;

    return candidateResult < candidateResult2 ? candidateResult2 : candidateResult;
}
