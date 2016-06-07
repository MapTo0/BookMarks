//
//  SearchViewController.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/6/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let searchField = UISearchBar()
    let tableView = UITableView()
    var filteredBooks = Array<AnyObject>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        searchField.frame = CGRect(x: 0, y: 64, width: self.view.bounds.size.width, height: 44)
        self.view.addSubview(searchField)
        tableView.frame = CGRect(x: 0, y: 108, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 156)
        self.view.addSubview(tableView)
        tableView.dataSource = self
        searchField.delegate = self
        tableView.delegate = self
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
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        searchField.resignFirstResponder()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedBook = filteredBooks[indexPath.row]
        let navigationController = self.navigationController
        let searchDetailsVC = SearchDetailsViewController()
        navigationController!.pushViewController(searchDetailsVC, animated: true)
        navigationController!.navigationItem.setHidesBackButton(false, animated: false)
        navigationController!.setNavigationBarHidden(false, animated: false)
        navigationController!.navigationBar.topItem?.title = "Search"
        searchDetailsVC.book = selectedBook as! Book
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
