//
//  SearchNavigationViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/4/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class SearchNavigationViewController: UINavigationController {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var filteredBooks = Array<AnyObject>()
    var searchViewController = SearchViewController()
    var detailsViewController = SearchDetailsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pushViewController(searchViewController, animated: true)
        self.navigationBar.hidden = false
        self.navigationBar.topItem?.title = "Search"
    }
}
