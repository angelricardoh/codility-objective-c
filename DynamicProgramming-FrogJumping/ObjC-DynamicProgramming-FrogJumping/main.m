//
//  main.m
//  ObjC-DynamicProgramming-FrogJumping
//
//  Created by Angel Ricardo on 6/13/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int frog(NSMutableArray *S, int k, int q);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *S = [[NSMutableArray alloc] initWithObjects:@1,@3,nil];
        int k = 5;
        int q = 10;
        
        NSLog(@"%d", frog(S, k, q));
    }
    return 0;
}

int frog(NSMutableArray *S, int k, int q)
{
    NSMutableArray * result = [[NSMutableArray alloc] init];
    int n = (int)S.count;
    int dp[k+1];
        for (int i=1; i<k+1; i++) {
            dp[i] = 0;
        }
    dp[0] = 1;
    
    for (int j=1; j<k+1; j++) {
        for (int i=0; i<n;i++) {
            if ([S[i] intValue] <= j) {
                dp[j] = (dp[j] + dp[j - [S[i] intValue]]);
            }
        }
    }
    
    return dp[k];
}
