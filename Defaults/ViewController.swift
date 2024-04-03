//  /*
//
//  Project: Defaults
//  File: ViewController.swift
//  Created by: Elaidzha Shchukin
//  Date: 02.04.2024
//
//  */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var textField: UITextField!
    @IBOutlet private var saveButton: UIButton!
    @IBOutlet private var segmentedControl: UISegmentedControl!
    @IBOutlet private var deleteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        segmentedControl .addTarget(self, action: #selector(didTapDeleteButton), for: .valueChanged)
    }
    
    @objc func didTapSaveButton()   {
        
    }
    
    @objc func didTapDeleteButton()   {
        
    }
    
    @objc func didTapSegmentedControl()   {
        
    }
    
}

