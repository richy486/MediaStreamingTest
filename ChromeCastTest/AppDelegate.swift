//
//  AppDelegate.swift
//  ChromeCastTest
//
//  Created by Richard Adem on 11/1/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

import UIKit
import GoogleCast

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let chromeApplicationID = "4F8B3483"//applicationID()
        
        let castOptions = GCKCastOptions(receiverApplicationID: chromeApplicationID)
        GCKCastContext.setSharedInstanceWith(castOptions)
        
        GCKLogger.sharedInstance().delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.rootViewController = MainViewController()
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: GCKLoggerDelegate {
//    - (void)logMessage:(NSString *)message fromFunction:(NSString *)function {
//    if (_enableSDKLogging) {
//    // Send SDK's log messages directly to the console.
//    NSLog(@"%@  %@", function, message);
//    }
//    }
    
    func logMessage(_ message: String, fromFunction function: String) {
        print("\(function) \(message)")
    }
    
}

let kPrefReceiverAppID = "receiver_app_id"
let kPrefCustomReceiverSelectedValue = "use_custom_receiver_app_id"
let kPrefCustomReceiverAppID = "custom_receiver_app_id"
let kPrefEnableMediaNotifications = "enable_media_notifications"

extension AppDelegate {
//    - (NSString *)applicationIDFromUserDefaults {
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    NSString *prefApplicationID = [userDefaults stringForKey:kPrefReceiverAppID];
//    if ([prefApplicationID isEqualToString:kPrefCustomReceiverSelectedValue]) {
//      prefApplicationID = [userDefaults stringForKey:kPrefCustomReceiverAppID];
//    }
//    NSRegularExpression *appIdRegex =
//    [NSRegularExpression regularExpressionWithPattern:@"\\b[0-9A-F]{8}\\b"
//    options:0
//    error:nil];
//    NSUInteger numberOfMatches = [appIdRegex
//    numberOfMatchesInString:prefApplicationID
//    options:0
//    range:NSMakeRange(0, [prefApplicationID length])];
//    if (!numberOfMatches) {
//    NSString *message = [NSString
//    stringWithFormat:
//    @"\"%@\" is not a valid application ID\n"
//    @"Please fix the app settings (should be 8 hex digits, in CAPS)",
//    prefApplicationID];
//    [self showAlertWithTitle:@"Invalid Receiver Application ID"
//    message:message];
//    return nil;
//    }
//    return prefApplicationID;
//    }
    
    func applicationID() -> String {
        //let prefApplicationID = "Chrome_Cast_Test"
        
        let userDefaults = UserDefaults.standard
        var prefApplicationID = userDefaults.string(forKey: kPrefReceiverAppID)!
        if prefApplicationID == kPrefCustomReceiverSelectedValue {
            prefApplicationID = userDefaults.string(forKey: kPrefCustomReceiverAppID)!
        }
        
        let appIdRegex = try! NSRegularExpression(pattern: "\\b[0-9A-F]{8}\\b", options: .init(rawValue: 0))
        
        let range = NSMakeRange(0, prefApplicationID.characters.count)
        let numberOfMatches = appIdRegex.numberOfMatches(in: prefApplicationID, options: .init(rawValue: 0), range: range)
        
        if numberOfMatches == 0 {
            print("\"\(prefApplicationID)\" is not a valid application ID")
        }
        
        
        
        return prefApplicationID
    }
    
    
}

