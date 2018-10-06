//
//  main.m
//  ObjC-Sorting-NumberOfDiscIntersections
//
//  Created by Angel Ricardo on 07/08/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiskRange:NSObject
@property (nonatomic) long long leftBound;
@property (nonatomic) long long rightBound;
@end

@implementation DiskRange
@end

int solution(NSMutableArray *A) {
    
    if (A == nil || A.count == 0) return 0;
    
    int n = (int)A.count;
    NSMutableArray *diskArray = [[NSMutableArray alloc] initWithCapacity:n];
    for (int i=0; i<n; i++) {
        DiskRange *diskRange = [[DiskRange alloc] init];
        diskRange.leftBound = i - [A[i] longValue];
        diskRange.rightBound = i + [A[i] longValue];
        [diskArray addObject:diskRange];
    }
    
    NSArray *sortedDisksByLeft = [diskArray sortedArrayUsingComparator:^(id obj1, id obj2){
        DiskRange *disk1 = obj1;
        DiskRange *disk2 = obj2;
        
        if (disk1.leftBound < disk2.leftBound)
            return NSOrderedAscending;
        else if (disk1.leftBound > disk2.leftBound)
            return NSOrderedDescending;
        else
            return NSOrderedSame;
    }];
    
    long intersections = 0;
    
    for (int i=0; i<n-1; i++) {
        DiskRange *currentDiskRange = sortedDisksByLeft[i];
        int j = i+1;
        DiskRange *compareDiskRange = sortedDisksByLeft[j];
        while (currentDiskRange.rightBound >= compareDiskRange.leftBound) {
            j += 1;
            intersections += 1;
            if (intersections > 10000000) return -1;
            if (j == n) break;
            compareDiskRange = sortedDisksByLeft[j];
        }
    }
    
    return (int)intersections;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
