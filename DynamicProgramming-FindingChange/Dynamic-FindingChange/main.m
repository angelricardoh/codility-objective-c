//
//  main.m
//  Dynamic-FindingChange
//
//  Created by Angel Ricardo on 6/9/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NAIVE_MAX(a,b) (a > b ? a : b)

#define NAIVE_MIN(a,b) (a < b ? a : b)

#if !defined MAX
#define MAX(a,b) \
({ __typeof__ (a) __a = (a); \
__typeof__ (b) __b = (b); \
__a > __b ? __a : __b; })
#endif

#if !defined MIN
#define MIN(a,b) \
({ __typeof__ (a) __a = (a); \
__typeof__ (b) __b = (b); \
__a < __b ? __a : __b; })
#endif

NSMutableArray *dynamic_coin_changing(NSMutableArray *C , int k);
NSMutableArray *dynamic_coin_changing_space_efficient(NSMutableArray *C, int k);
int n;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int k = 6;
        NSMutableArray *C = [[NSMutableArray alloc] initWithObjects:@1,@3,@4,nil];
        NSMutableArray *result = dynamic_coin_changing_space_efficient(C, k);
        for (NSNumber *change in result) {
            NSLog(@"%d", [change intValue]);
        }
    }
    return 0;
}

NSMutableArray *dynamic_coin_changing(NSMutableArray *C, int k)
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int n = C.count;
    int dp[n+1][k+1];
    for (int j=0; j<n+1; j++) {
        dp[j][0] = 0;
    }
    for (int i=1; i<k+1; i++) {
        dp[0][i] = 999999;
    }
    for (int i=1; i<n+1; i++) {
        for (int j=0; j<=[C[i-1] intValue]; j++) {
            dp[i][j] = dp[i - 1][j];
        }
        for (int j=[C[i-1] intValue]; j<k+1; j++) {
            dp[i][j] = MIN(dp[i][j - [C[i - 1] intValue]] + 1, dp[i - 1][j]);
        }
    }
    for (int j=0; j<k+1; j++) {
        [result addObject:[NSNumber numberWithInt:dp[n][j]]];
    }
    return result;
}


NSMutableArray *dynamic_coin_changing_space_efficient(NSMutableArray *C, int k)
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    int n = (int)C.count;
    int dp[k+1];
    dp[0] = 0;
    for (int i=1; i<k+1; i++) {
        dp[i] = 999999;
    }
    for (int i=1; i<n+1; i++) {
        for (int j=[C[i-1] intValue]; j<k+1; j++) {
            dp[j] = MIN(dp[j - [C[i - 1] intValue]] + 1, dp[j]);
        }
    }
    
    for (int i=0; i<k+1; i++) {
        [result addObject:[NSNumber numberWithInt:dp[i]]];
    }
        
    return result;
}

//1 def dynamic_coin_changing(C, k):
//2 n = len(C)
//3 dp = [0] + [MAX_INT] * k
//4 for i in xrange(1, n + 1):
//5 for j in xrange(C[i - 1], k + 1):
//6 dp[j] = min(dp[j - C[i - 1]] + 1, dp[j])
//7 return dp

//def dynamic_coin_changing(C, k):
//2 n = len(C)
//3 # create two-dimensional array with all zeros
//4 dp = [[0] * (k + 1) for i in xrange(n + 1)]
//5 dp[0] = [0] + [MAX_INT] * k
//6 for i in xrange(1, n + 1):
//7 for j in xrange(C[i - 1]):
//8 dp[i][j] = dp[i - 1][j]
//9 for j in xrange(C[i - 1], k + 1):
//10 dp[i][j] = min(dp[i][j - C[i - 1]] + 1, dp[i - 1][j])
//11 return dp[n]
