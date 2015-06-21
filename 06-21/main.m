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
    NSLog(@"$%d in %@", self.balance, self.name);
    
}

@end

@interface Patron : NSObject

- (void)withdrawlAmount:(int)amount fromAccount:(BankAccount *)account;
- (void)depositAmount:(int)ammount toAccount:(BankAccount *)account;
- (void)checkassets;
- (void)addAccount:(BankAccount *)account;

@property (nonatomic) int pocket;
@property (nonatomic) NSMutableArray* accounts;
@property (nonatomic) NSString *name;
@end

@implementation Patron {
    int withdrawnlAmount;
    int depositAmount;
    
}
- (void) addAccount:(BankAccount *)account{
    // run a check to make sure that self.account is not nil
    if (self.accounts == nil) {
        self.accounts = [[NSMutableArray alloc] init];
    }
    [self.accounts addObject:account];
}

- (BankAccount *)defaultAccount {
    return [self.accounts firstObject];
}
- (BankAccount *)accountAtIndex:(int)index{
    return self.accounts[index];
}
//[Bob accountAtIndex:1];


- (void)withdrawlAmount:(int)amount fromAccount:(BankAccount *)account{
    withdrawnlAmount = amount;
    if (withdrawnlAmount <= account.balance) {
        
        account.balance -= withdrawnlAmount;
        self.pocket += withdrawnlAmount;
        NSLog(@"%@ Withdrawned %d from %@", self.name, withdrawnlAmount, account.name);
    }
    else {
        NSLog(@"Insuffiencet Funds");
    }
}
- (void)depositAmount:(int)ammount toAccount:(BankAccount *)account{
    depositAmount = ammount;
    if (depositAmount<= self.pocket) {
        
        account.balance += depositAmount;
        self.pocket -= depositAmount;
        NSLog(@"%@ Deposited $%d into %@", self.name, depositAmount, account.name);
    }
    else
    {
        NSLog(@" You don't have enough money");
    }
}

-(void) checkassets{
    NSLog(@"%@ has $%d in their wallet ", self.name, self.pocket);
    for (int i = 0; i < [self.accounts count]; i++){
        NSLog(@"and $%d in %@",[self accountAtIndex:i].balance, [self accountAtIndex:i].name);
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BankAccount *BobsFamilyAccount =[[BankAccount alloc] init];
       
        BobsFamilyAccount.balance = 600;
        BobsFamilyAccount.name = @"Bob's Family Account";
        [BobsFamilyAccount checkBalance];
        
        BankAccount *BobsOffShoreAccount = [[BankAccount alloc] init];
        BobsOffShoreAccount.balance = 20000;
        BobsOffShoreAccount.name = @"Bob's Off-Shore Account";
        
        Patron *Bob = [[Patron alloc] init];
        [Bob addAccount:BobsFamilyAccount];
        [Bob addAccount:BobsOffShoreAccount];
        Bob.pocket = 20;
        Bob.name = @"Bob";
        

        Patron *BobsMom = [[Patron alloc] init];
        [BobsMom addAccount:BobsFamilyAccount];

        
        BobsMom.pocket = 100;
        BobsMom.name = @"Bob's Mom";
        [Bob depositAmount:10 toAccount:[Bob defaultAccount]];
        [Bob depositAmount:10 toAccount:[Bob accountAtIndex:1]];
        
       [Bob checkassets];
       [BobsMom checkassets];
        [BobsMom withdrawlAmount:610 fromAccount:[BobsMom defaultAccount]];
        
    }
    return 0;
}
