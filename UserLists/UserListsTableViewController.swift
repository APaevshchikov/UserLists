//
//  UserListsTableViewController.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 29.05.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import UIKit

class UserListsTableViewController: UITableViewController {
    
    var lists = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        print(#function)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        
        return cell
    }

}
