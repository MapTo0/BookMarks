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
    var filteredBooks = Array<AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.frame = CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: 44)
        self.view.addSubview(searchField)
        tableView.frame = CGRect(x: 0, y: 64, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 64)
        self.view.addSubview(tableView)
        tableView.dataSource = self
        searchField.delegate = self
        filteredBooks = appDelegate.books as Array<AnyObject>
    
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        
        let currentBook = filteredBooks[indexPath.row] as! Book
        cell?.textLabel?.text = currentBook.name
        cell?.detailTextLabel?.text = "by " + currentBook.author
        cell?.imageView?.image = UIImage(data: currentBook.imgData)
        
        return cell!
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if (searchBar.text == "") {
            filteredBooks = appDelegate.books as Array<AnyObject>
        } else {
            let bookNamePredicate = NSPredicate(format: "name contains[c] %@", searchBar.text!)
            filteredBooks = appDelegate.books.filteredArrayUsingPredicate(bookNamePredicate) as Array<AnyObject>
        }
        tableView.reloadData()
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.enablesReturnKeyAutomatically = false
        return true
    }

}
