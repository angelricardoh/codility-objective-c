//
//  main.m
//  GreedyFindingChange
//
//  Created by Angel Ricardo on 6/5/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PairResult:NSObject
@property (nonatomic) int coinValue;
@property (nonatomic) int ocurrences;
@end

@implementation PairResult
@end

NSArray *greedyCoinChanging(NSMutableArray *M, int k);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *testCase = [[NSMutableArray alloc] initWithObjects:@1,@3,@4, nil];
        NSArray *result = greedyCoinChanging(testCase, 6);
        for (int i=0; i<result.count; i++) {
            PairResult *pairResult = result[i];
            NSLog(@"coin with value = %d ocurrences %d", pairResult.coinValue, pairResult.ocurrences);
        }
    }
    return 0;
}

NSArray *greedyCoinChanging(NSMutableArray *M, int k) {
    int n = M.count;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i=n-1; i>=0; i--) {
        PairResult *pairResult = [[PairResult alloc] init];
        pairResult.coinValue = [M[i] intValue];
        pairResult.ocurrences = k / [M[i] intValue];
        [result addObject:pairResult];
        k %= [M[i] intValue];
    }
    
    return result;
}