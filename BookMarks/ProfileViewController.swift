//
//  ProfileViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/12/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        // Do any additional setup after loading the view.
        let app = FIRAuth(app: FIRApp.defaultApp()!)
        let currentUser = app?.currentUser
        try! app!.signOut()
        
        let testLable = UILabel()
        testLable.text = "wtf"
        testLable.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(testLable)
        if (currentUser == nil) {
            let firstViewController = self.tabBarController?.viewControllers![0]
            self.tabBarController?.selectedIndex = 0
            self.tabBarController?.selectedViewController = firstViewController
        } else {
            let firstViewController = self.tabBarController?.viewControllers![0] as! UINavigationController
            firstViewController.navigationBar.hidden = false
            firstViewController.viewControllers.popLast()
            firstViewController.popViewControllerAnimated(false)
            self.tabBarController?.selectedIndex = 0
            self.tabBarController?.selectedViewController = firstViewController
        }
    }
}
    

