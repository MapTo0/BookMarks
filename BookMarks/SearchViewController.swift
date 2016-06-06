//
//  SearchViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/4/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit
import Firebase

class SearchViewController: UINavigationController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let searchField = UISearchBar()
    let tableView = UITableView()
    var filteredBooks = Array<AnyObject>()
    var firstViewController = UIViewController()
    var secondViewController = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(firstViewController)
        searchField.frame = CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: 44)
        firstViewController.view.addSubview(searchField)
        tableView.frame = CGRect(x: 0, y: 64, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 108)
        firstViewController.view.addSubview(tableView)
        tableView.dataSource = self
        searchField.delegate = self
        tableView.delegate = self
        filteredBooks = appDelegate.books as Array<AnyObject>
        
        secondViewController.view.backgroundColor = UIColor.whiteColor()
        firstViewController.view.backgroundColor = UIColor.whiteColor()
        self.setNavigationBarHidden(true, animated: false)
        
        
        
    }
    
    //Dismisses keyboard when user presses return or done
    func textFieldShouldReturn(textField: UITextField!) ->Bool {
        textField.resignFirstResponder()
        return true
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var clickedBook = filteredBooks[indexPath.row]
        self.pushViewController(secondViewController, animated: true)
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.setNavigationBarHidden(false, animated: false)
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
