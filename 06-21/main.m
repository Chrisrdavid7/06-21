//
//  main.m
//  06-21
//
//  Created by Chris David on 6/21/15.
//  Copyright (c) 2015 Chris David. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patron : NSObject
- (void)pocket:(int)p;
- (void)with:(int)w;
- (void)depo:(int)d;
@end

@implementation Patron {
    int pocket;
    int withdrawn;
    int deposit;
}
- (void) pocket:(int) p{
    pocket = p;
}
- (void)with: (int) w{
    withdrawn = w;
}
- (void)depo: (int) d{
    deposit = d;
}

@end


@interface BankAccount : NSObject
- (void)balance:(int)n;

@end

@implementation BankAccount {
int accbalance;
    int withdrawn;
}
- (void)balance: (int) n {
    accbalance = n;
}
- (void)trans: (int) w{
    withdrawn = w;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        BankAccount *testsAccount =[[BankAccount alloc] init];
        [testsAccount balance:2];
        
        
      printf("Did it work?");  
        
        
        
    }
    return 0;
}
