
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
        return tableViewAlt.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentLastItem = tableViewAlt[indexPath.row]
        cell.textLabel?.text = currentLastItem.cellText
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 11, weight: .light)        
        cell.imageView?.image = currentLastItem.cellImage
        
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Pass for now
    }
    
}

extension ViewController {
    // Picker View Formatting
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return pickerData.count }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return pickerData[row] }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // On Select of Picker View
        currentFocus = "D*\(pickerData[row])"
        Earth.firstMaterial?.diffuse.contents = UIImage(named: "\(pickerData[row]).jpg")
        let queryAnswer: contextQuery = returnContext(query: currentFocus)
        contextLabel.text = queryAnswer.title
        contextDescription.text = queryAnswer.desc
        tableViewAlt.removeAll()
        for item in queryAnswer.tableData {
            tableViewAlt.append(item)
        
        tableView.reloadData()
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // Formatting Picker View
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17.0),NSAttributedString.Key.foregroundColor:UIColor.black])
        return myTitle
    }
}
