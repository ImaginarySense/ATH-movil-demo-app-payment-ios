//
//  AthMovilPaySDK.h
//  AthMovilPaySDK
//
//  Created by Victor Ortiz on 10/15/16.
//  Copyright © 2016 va2ron1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AthMovilPaySDK : NSObject
-(void)requestPayment:(float)amount phoneNumber:(NSString *)phoneNumber referenceId:(NSString *)referenceId urlCallback:(NSString *)urlCallback;
-(void)verifyPayment:(NSString *)transactionReciept completion:(void (^) (NSString *data))handler;
@end
