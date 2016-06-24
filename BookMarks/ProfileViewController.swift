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
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        
        try! myApp!.signOut()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        let app = FIRAuth(app: FIRApp.defaultApp()!)
        var currentUser = app?.currentUser
        
        if (currentUser == nil) {
            self.navigationController?.navigationBarHidden = true
        } else {
            self.navigationController?.navigationBarHidden = true
        }
    }
}
