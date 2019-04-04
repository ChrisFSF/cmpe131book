//
//  DetailTableViewController.swift
//  cmpe131book
//
//  Created by 安博 on 4/3/19.
//  Copyright © 2019 SJSU CMPE131. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    
    @IBOutlet weak var T: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var Genre: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var pages: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var IBSN: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}