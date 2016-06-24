//
//  FirstViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 5/28/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        let user = myApp?.currentUser
        
        
        if (user == nil) {
            self.view = self.view
            self.navigationController!.setNavigationBarHidden(false, animated: false)
            self.navigationController!.navigationBar.topItem?.title = "BookMarks"
            self.navigationController?.tabBarItem.title = "Login"
            self.navigationController?.tabBarItem.image = UIImage(named: "login")
        } else {
            self.navigationController!.setNavigationBarHidden(false, animated: false)
            self.navigationController!.navigationBar.topItem?.title = "Home"
            self.navigationController?.tabBarItem.title = "Home"
            self.navigationController?.tabBarItem.image = UIImage(named: "home")
            self.view = homeView()
        }
    }
}

