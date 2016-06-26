//
//  InitialViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/26/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class InitialViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let item = (self.tabBarController?.tabBar.items?.last)! as UITabBarItem
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser
        
        if (user == nil) {
            item.enabled = false
        } else {
            item.enabled = true
        }
    }
}
