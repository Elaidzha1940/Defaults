Defaults.
=========

User Defaults is a fundamental mechanism in iOS development that allows you to store small pieces of data persistently.
---------

UserDefaults
---------
````ruby
https://developer.apple.com/documentation/foundation/userdefaults
````
---------

Difference between UserDefaults & @AppStorage
---------
- @AppStorage is suited for individual pieces of data like variables and constants.
- If you had to store anything more complex (like a struct or a class, or a collection thereof), you're probably best service using UserDefaults.

---------

UIKit / Storyboard
---------
````ruby
import UIKit
import SwiftUI

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
````
--------

SwiftUI / UserDefaults
--------
````ruby
import SwiftUI

struct iExpense: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        VStack {
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
            .font(.headline)
            .bold()
            .foregroundStyle(Color(.label))
            .padding()
            .background(Color.brown.gradient)
            .cornerRadius(15)
        }
    }
}

#Preview {
    iExpense()
}
````
--------

SwiftUI / @AppStorage
--------

````ruby
import SwiftUI

struct iExpense: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        VStack {
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
            }
            .font(.headline)
            .bold()
            .foregroundStyle(Color(.label))
            .padding()
            .background(Color.brown.gradient)
            .cornerRadius(15)
        }
    }
}

#Preview {
    iExpense()
}
````
---------


