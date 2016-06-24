
//
//  AppDelegate.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 5/28/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var firebaseBooks = FIRDatabaseReference()
    var firebaseUsers = FIRDatabaseReference()
    var userFirebaseBooks = FIRDatabaseReference()
    var userBooks = NSDictionary()
    var books = NSMutableArray()
    var isUserLogged = false
    var userId = ""

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        firebaseBooks = FIRDatabase.database().reference().child("books")
        firebaseUsers = FIRDatabase.database().reference().child("users")
        
        firebaseBooks.observeEventType(.Value, withBlock: { snapshot in
            let tempFirebaseBooks = snapshot.value as! NSArray
            self.castBooks(tempFirebaseBooks);
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser
        if (user != nil) {
            userFirebaseBooks = FIRDatabase.database().reference().child("users").child((user?.uid)!).child("books")
            userFirebaseBooks.observeEventType(.Value, withBlock: { snapshot in
                self.userBooks = snapshot.value as! NSDictionary
                print("we are finally here");
                }, withCancelBlock: { error in
                    print(error.description)
            })
        }
        return true
    }
    
    func castBooks(firebaseBooks: NSArray) {
        firebaseBooks.forEach { (book) in
            let bookName = book.objectForKey("name")
            let author = book.objectForKey("author")
            let description = book.objectForKey("description")
            let databaseImageUrl = book.objectForKey("img") as! String
            let imageUrl = NSURL(string: databaseImageUrl)
            let data = NSData(contentsOfURL: imageUrl!)
            let bookObj = Book();
            bookObj.author = author as! String
            bookObj.name = bookName as! String
            bookObj.imgData = data! as NSData
            bookObj.bookDescription = description as! String

            books.addObject(bookObj)
            print(bookObj.name)
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

