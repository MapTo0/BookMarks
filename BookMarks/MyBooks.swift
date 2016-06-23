//
//  MyBooks.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/12/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class MyBooks: UIView, UITableViewDelegate, UITableViewDataSource {

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let tableView = UITableView()
    var filteredBooks = Array<AnyObject>()
    var userBooks = NSDictionary()
    
    override func layoutSubviews() {
        self.backgroundColor = UIColor.whiteColor()
        self.tableView.frame = CGRect(x: 60, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(appDelegate.userBooks.count)
        
        return appDelegate.userBooks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        
        var componentArray = Array(appDelegate.userBooks.allKeys)
        
        let currentBook = componentArray[indexPath.row]
        cell?.textLabel?.text = currentBook as! String
        
        return cell!
    }

}
