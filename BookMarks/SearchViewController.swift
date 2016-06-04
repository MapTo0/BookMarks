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
    let candies = ["wtf", "wtf2", "wtf3"]
    let books = NSMutableArray()
    
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
        print(books.count)
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("wtf")
        
//        var url = NSURL.URLWithString("http://lightswitchtimer.co.uk/wp-content/uploads/2013/12/lights-for-pets.jpg")
//        var data = NSData(contentsOfURL : url)
//        var image = UIImage(data : data)
//        cell?.imageView?.image = UIImage (data: data!)
//        c.image = UIImage(data: data!)
        
//        cell?.detailTextLabel = "subtitle"
        cell?.textLabel?.text = appDelegate.books[indexPath.row] as! String
        
        return cell!
    }

}
