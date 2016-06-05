//
//  SearchViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/4/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let searchField = UISearchBar()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.frame = CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: 44)
        self.view.addSubview(searchField)
        
        tableView.frame = CGRect(x: 0, y: 64, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 64)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "wtf")
        tableView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
    
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.books.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("wtf")
        let imageUrl = NSURL(string: "https://httpsimage.com/img/kuche.jpg")
        let data = NSData(contentsOfURL: imageUrl!)

        if cell != nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "wtf")
        }
        
        cell?.textLabel?.text = appDelegate.books[indexPath.row] as? String
        cell?.detailTextLabel?.text = "by " + (appDelegate.authors[indexPath.row] as! String)
        cell?.imageView?.image = UIImage(data: data!)
        
        return cell!
    }

}
