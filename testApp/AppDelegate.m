//
//  AppDelegate.m
//  testApp
//
//  Created by Victor Ortiz on 10/15/16.
//  Copyright © 2016 va2ron1. All rights reserved.
//

#import "AppDelegate.h"
#import "AthMovilPaySDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	return YES;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
	AthMovilPaySDK *athMovil = [[AthMovilPaySDK alloc] init];
	[athMovil verifyPayment:[url relativeString] completion:^(NSString *data) {
		id json = [NSJSONSerialization JSONObjectWithData:[data dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
		if([[json objectForKey:@"responseStatus"] isEqualToString:@"SUCCESS"] && [[json objectForKey:@"amount"] isEqualToString:@"147.660004"] && [[json objectForKey:@"status"] isEqualToString:@"COMPLETED"]){
			UIAlertController * alert = [UIAlertController
										 alertControllerWithTitle:@"Payment Completed"
										 message:@"The payment has been successfully completed."
										 preferredStyle:UIAlertControllerStyleAlert];
			
			
	   UIAlertAction* noButton = [UIAlertAction
								  actionWithTitle:@"Close"
								  style:UIAlertActionStyleDefault
								  handler:^(UIAlertAction * action) {
								  }];
				
	   [alert addAction:noButton];
				
	   [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
		}else{
			UIAlertController * alert = [UIAlertController
										 alertControllerWithTitle:@"Payment Failed"
										 message:@"Something has been happen, please try again."
										 preferredStyle:UIAlertControllerStyleAlert];
			
			
			UIAlertAction* noButton = [UIAlertAction
									   actionWithTitle:@"Close"
									   style:UIAlertActionStyleDefault
									   handler:^(UIAlertAction * action) {
									   }];
			
			[alert addAction:noButton];
			
			[self.window.rootViewController presentViewController:alert animated:YES completion:nil];
		}
	}];
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
