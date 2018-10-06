//
//  main.m
//  Greedy-Canoeist
//
//  Created by Angel Ricardo on 6/5/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int greedyCanoeistB(NSMutableArray *W, int k){
    int canoes = 0;
    int j = 0;
    int i = (int)W.count - 1;
    while (i >= j) {
        if ([W[i] intValue] + [W[j] intValue] <= k) {
            j += 1;
        }
        canoes += 1;
        i -= 1;
    }
    
    return canoes;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *testCase = [[NSMutableArray alloc] initWithObjects:@1,@2,@3,@5,@7,@10, nil];
        NSLog(@"%d", greedyCanoeistB(testCase, 12));
    }
    return 0;
}
