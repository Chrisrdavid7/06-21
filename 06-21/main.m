//
//  main.m
//  06-21
//
//  Created by Chris David on 6/21/15.
//  Copyright (c) 2015 Chris David. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface BankAccount : NSObject

-(void)checkBalance;

@property (nonatomic) int balance;

@end

@implementation BankAccount

-(void)checkBalance{
    NSLog(@"$%d in the account", self.balance);
}

@end

@interface Patron : NSObject

- (void)with:(int)w;
- (void)depo:(int)d;

@property (nonatomic) int pocket;
@property (nonatomic) BankAccount* account;

@end

@implementation Patron {
    int withdrawn;
    int deposit;
    
}
- (void)with: (int) w{
    withdrawn = w;
}
- (void)depo: (int) d{
    deposit = d;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        BankAccount *BobsFamilyAccount =[[BankAccount alloc] init];
        BobsFamilyAccount.balance = 600;
        
        [BobsFamilyAccount checkBalance];
        
        Patron *Bob = [[Patron alloc] init];
        Bob.account = BobsFamilyAccount;
        Bob.pocket = 20;
        
        Patron *BobsMom = [[Patron alloc] init];
        BobsMom.account = BobsFamilyAccount;
        BobsMom.pocket = 100;
        
        
        
        NSLog(@"Bob has $%d in the bank and $%d in his pocket", Bob.account.balance, Bob.pocket);
        NSLog(@"Bob's Mom has $%d in the bank and $%d in her pocket", BobsMom.account.balance, BobsMom.pocket);
    }
    return 0;
}
