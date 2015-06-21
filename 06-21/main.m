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
@property (nonatomic) NSString *name;

@end

@implementation BankAccount

-(void)checkBalance{
    NSLog(@"$%d in the account", self.balance);
}

@end

@interface Patron : NSObject

- (void)with:(int)w;
- (void)depo:(int)d;
- (void)checkassets;

@property (nonatomic) int pocket;
@property (nonatomic) BankAccount* account;
@property (nonatomic) NSString *name;
@end

@implementation Patron {
    int withdrawn;
    int deposit;
    
}
- (void)with: (int) w{
    withdrawn = w;
    if (withdrawn <= self.account.balance) {
        
        self.account.balance -= withdrawn;
        self.pocket += withdrawn;
        NSLog(@"%@ Withdrawned %d", self.name, withdrawn);
    }
    else {
        NSLog(@"Insuffiencet Funds");
    }
}
- (void)depo: (int) d{
    deposit = d;
    if (deposit<= self.pocket) {
        
        self.account.balance += deposit;
        self.pocket -= deposit;
        NSLog(@"%@ Deposited $%d", self.name, deposit);
    }
    else
    {
        NSLog(@" You don't have enough money");
    }
}

-(void) checkassets{
     NSLog(@"Bob's Mom has $%d in %@ and $%d in their wallet", self.account.balance, self.account.name, self.pocket);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BankAccount *BobsFamilyAccount =[[BankAccount alloc] init];
       
        BobsFamilyAccount.balance = 600;
        [BobsFamilyAccount checkBalance];
        BobsFamilyAccount.name = @"Bob's Family Account";
        
        Patron *Bob = [[Patron alloc] init];
        Bob.account = BobsFamilyAccount;
        Bob.pocket = 20;
        Bob.name = @"Bob";
        
        [Bob depo:10];
        
        Patron *BobsMom = [[Patron alloc] init];
        BobsMom.account = BobsFamilyAccount;
        BobsMom.pocket = 100;
        BobsMom.name = @"Bob's Mom";
        
       [Bob checkassets];
       [BobsMom checkassets];
    }
    return 0;
}
