//
//  ViewController.swift
//  Static-Example
//
//  Created by Giovanni on 25/07/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import Static

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Toggle this to verify that the is configured correctly
        let useStatic = true
        if useStatic {
            let _ = DataSource(tableView: tableView, sections: [
                Section(rows: [
                    Row(text: "Hello I'm a Row")
                    ])
                ])
        } else {
            tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
        }
    }

    // MARK: UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = "Cell number \(indexPath.row + 1)"
        return cell
    }
}

