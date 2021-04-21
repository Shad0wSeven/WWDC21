
// UIExtensions.swift

// This file has extensions and functions from the ViewController
// I know having every function for a module in an Extension is Lazy, but hey! modules!

// Imports
import UIKit
import SceneKit
import ARKit
import QuartzCore
import PlaygroundSupport
import Foundation

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // Table View Formatting
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = tableViewData[indexPath.row]
        return cell
    }
    
}

extension ViewController {
    // Picker View Formatting
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return pickerData.count }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return pickerData[row] }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // On Select of Picker View
        if(currentEarth != pickerData[row]) {
            currentEarth = pickerData[row]
            //              updateEarthImage()
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // Formatting Picker View
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17.0),NSAttributedString.Key.foregroundColor:UIColor.black])
        return myTitle
    }
}
