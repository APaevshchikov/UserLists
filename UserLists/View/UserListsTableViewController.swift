//
//  UserListsTableViewController.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 29.05.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UserListsTableViewController: UITableViewController {
    
    let networking = Networking.shared
    lazy var sessionID = "NOPE"
    lazy var lists = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        
        networking.getSessionID { [weak self] session in
            guard let self = self else { return }

            self.sessionID = session
            print(self.sessionID)
        }
        
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        networking.getEntries { [weak self] entries in
            guard let self = self else { return }
            
            self.lists = entries
//            print(self.lists)
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        cell.shortTextView.text = lists[indexPath.row]
        
        return cell
    }
    
}


