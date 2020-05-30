//
//  CreationListViewController.swift
//  UserLists
//
//  Created by Арсений Паевщиков on 29.05.2020.
//  Copyright © 2020 Arseniy Paevshchikov. All rights reserved.
//

import UIKit

class CreationListViewController: UIViewController {
    
    @IBOutlet weak var creationTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCloseButton()
        setupSaveButton()
    }
    
    
}

extension CreationListViewController {
    //left bar button
    func setupCloseButton() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                          target: self,
                                          action: #selector(closeVC))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    //right bar button
    func setupSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                         target: self,
                                         action: #selector(saveData))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func closeVC() {
        navigationController?.popViewController(animated: true)
        //        self.dismiss(animated: true, completion: nil)
        print("closed")
    }
    
    @objc func saveData() {
        navigationController?.popViewController(animated: true)
        //        self.dismiss(animated: true, completion: nil)
        print("data saved")
    }
}


