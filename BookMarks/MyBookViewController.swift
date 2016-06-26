//
//  MyBookViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/11/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class MyBookViewController: UIViewController {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 64))
        let navItem = UINavigationItem(title: "My Books");
        navBar.setItems([navItem], animated: false);
        navBar.barStyle = UIBarStyle.Default
        navBar.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(navBar);
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser
        
        if (user == nil) {
            let notLoggedView = MyBooksNotLogged()
            notLoggedView.frame = CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height - 64)
            self.view.addSubview(notLoggedView)
        } else {
            let myBooksView = MyBooks()
            myBooksView.frame = CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height - 64)
            self.view.addSubview(myBooksView)
        }
    }
}
