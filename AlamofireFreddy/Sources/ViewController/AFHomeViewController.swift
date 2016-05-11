//
//  AFHomeViewController.swift
//  AlamofireSwiftyJson
//
//  Created by Luiz Duraes on 5/2/16.
//  Copyright © 2016 Luiz Duraes. All rights reserved.
//

import UIKit
import SwiftSpinner

class AFHomeViewController: UIViewController {
    // MARK: - Constants
    private let kCellIdentifier = "homeTableViewCell"
    private let kErrTitle = "Error"
    private let kErrMessage = "Loading contacts"
    private let kButtonOk = "Ok"
    private let kLoading = "Loading"
    
    // MARK: - Properties
    private var contacts = [AFContact] ()
    private var mainView: AFHomeView {
        return self.view as! AFHomeView
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    // MARK: - Private
    private func config() {
        configUIElements()
        loadDataSourceItems()
    }
    
    private func configUIElements() {
        self.mainView.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    private func loadDataSourceItems() {
        let business = AFContactBusiness()
        SwiftSpinner.show(kLoading)
        business.retrieveContacts { (result) in
            do {
                let contactList = try result()
                self.contacts = contactList
                self.mainView.tableView .reloadData()
                SwiftSpinner.hide()
            } catch {
                SwiftSpinner.hide()
                self.showAlert(self.kErrTitle, message: self.kErrMessage)
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message:message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: kButtonOk, style: .Default) { _ in })
        self.presentViewController(alertController, animated: true) { }
    }
}

// MARK: - UITableViewDataSource
extension AFHomeViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath)
        fill(cell, indexPath: indexPath)
        return cell;
    }

    // MARK: - Private
    private func fill(cell: UITableViewCell, indexPath: NSIndexPath) {
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.email
    }
}

// MARK: - UITableViewDelegate
extension AFHomeViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}