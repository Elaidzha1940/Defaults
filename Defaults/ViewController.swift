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
        segmentedControl.addTarget(self, action: #selector(didTapSegmentedControl), for: .valueChanged)
        
        saveCurrentLaunch()
        statusLabel.text = "Run App: \(UserDefaults.standard.integer(forKey: numberOfLaunchesKey))"
        textField.text =  UserDefaults.standard.string(forKey: inputTextKey)
        segmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: segmentIndex)
    }
    
    @objc func didTapSaveButton()   {
        guard let text = textField.text else { return }
        UserDefaults.standard.set(text, forKey: inputTextKey)
    }
    
    @objc func didTapDeleteButton()   {
        let keys = [numberOfLaunchesKey, inputTextKey, segmentIndex]
        keys.forEach {
            UserDefaults.standard.set(nil, forKey: $0)
        }
    }
    
    @objc func didTapSegmentedControl(sender: UISegmentedControl)   {
        UserDefaults.standard.set(sender.selectedSegmentIndex, forKey: segmentIndex)
    }
    
    func saveCurrentLaunch() {
        let index = UserDefaults.standard.integer(forKey: numberOfLaunchesKey)
        UserDefaults.standard.set(index + 1, forKey: numberOfLaunchesKey)
    }
    
    // MARK: - Private constants
    private let numberOfLaunchesKey = "NumberOfLaunches"
    private let inputTextKey = "InputText"
    private let segmentIndex = "SegmentControlIndex"
}

