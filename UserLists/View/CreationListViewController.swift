//
//  CreationListViewController.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 29.05.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import UIKit

class CreationListViewController: UIViewController {

    let networking = Networking.shared
    var sessionID = ""
    
    @IBOutlet weak var creationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        print(#function)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        networking.addEntry("Hello, Moto")
        
        navigationController?.popViewController(animated: true)
        print(#function)
    }
    
}
