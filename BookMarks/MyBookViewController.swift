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
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser
        
        if (user == nil) {
            self.view = MyBooksNotLogged()
        } else {
            self.view = MyBooks()
        }
    }
}
