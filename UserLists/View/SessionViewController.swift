//
//  SessionViewController.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 03.06.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController {
    
    let dependencyManager = DependencyManager.shared
    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var sessionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dependencyManager.getInteractor().getEntriesList { entries in
            self.sessionLabel.text = entries.description
        }
    }
    
    @IBAction func senMessageButtonPressed(_ sender: UIButton) {
        dependencyManager.getInteractor().addNewPost(message: inputTextView.text) { isSuccess in
            self.sessionLabel.text = isSuccess ? "OK" : "Fail"
            
            self.dependencyManager.getInteractor().getEntriesList { entries in
                self.sessionLabel.text = entries.description
            }
        }
    }
    
}
