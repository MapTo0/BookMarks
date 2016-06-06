//
//  SearchDetailsViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/6/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class SearchDetailsViewController: UIViewController {

    var book = Book()
    override func viewDidLoad() {
        super.viewDidLoad()
        let myApp = FIRAuth(app: FIRApp.defaultApp()!)
        FIRAuth.auth()!.addAuthStateDidChangeListener() { (auth, user) in
            if let user = user {
                print("toq e lognat: ", user.uid)
                try! FIRAuth.auth()!.signOut()
            } else {
                print("nqma nikoi lognat")
            }
        }
        self.view.backgroundColor = UIColor.whiteColor()
    }
}