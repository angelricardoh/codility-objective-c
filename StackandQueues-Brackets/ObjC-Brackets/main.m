//
//  main.m
//  ObjC-Brackets
//
//  Created by Angel Ricardo on 8/3/15.
//  Copyright (c) 2015 Angel Ricardo. All rights reserved.
//

#import <Foundation/Foundation.h>

int solution(NSString *S) {
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    for (int i=0; i<S.length; i++) {
        char c = [S characterAtIndex:i];
        NSNumber *charNumber;
        switch(c){
            case '{':
            case '[':
            case '(':
                charNumber = [NSNumber numberWithChar:c];
                [stack addObject:charNumber];
                break;
            case '}':
            case ']':
            case ')':
                charNumber = [stack lastObject];
                char lastChar = [charNumber charValue];
                if ((c == '}' && lastChar == '{') ||
                    (c == ']' && lastChar == '[') ||
                    (c == ')' && lastChar == '(')) {
                    [stack removeLastObject];
                }
                else {
                    return 0;
                }
                break;
        }
    }
    
    if (stack.count == 0) return 1;
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
