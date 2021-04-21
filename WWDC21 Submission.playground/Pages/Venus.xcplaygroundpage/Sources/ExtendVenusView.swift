// Menus.swift

// This file will contain functions that are from ViewController, that are gesture outputs

// Imports
import UIKit
import SceneKit
import ARKit
import QuartzCore
import PlaygroundSupport
import Foundation

extension VenusViewController {
    // Tap Object
    @objc func handleTap(rec: UITapGestureRecognizer){
        let location = rec.location(in: sceneView)
        
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0] 
            let node = result.node
            if(node.name != nil) {
//                  print(node.name ?? "Failure")
                currentFocus = node.name ?? "E"
                let stringToDo: String = node.name?.components(separatedBy: "-")[1] ?? "0"
                let index = Int(stringToDo) ?? 0
                let queryAnswer = venusData[index]
                contextLabel.text = queryAnswer.header
                contextDescription.text = queryAnswer.desc
                contextImage.image = UIImage(named: queryAnswer.img)
            }
        }
    }
    
    // Pan Earth
    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        // Rotation, sort of scuffed right now. . .
        let translation = gestureRecognizer.translation(in: gestureRecognizer.view!)
        let x = Float(translation.x)
        let y = Float(-translation.y)
        let anglePan = (sqrt(pow(x,2)+pow(y,2)))*(Float)(Double.pi)/180.0
        var rotationVector = SCNVector4()
        rotationVector.x = x
        rotationVector.y = y
        rotationVector.z = 0.0
        rotationVector.w = anglePan
        self.venusNode.rotation = rotationVector
    }
}


extension VenusViewController {
    // Picker View Formatting
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return pickerData.count }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return pickerData[row] }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // On Select of Picker View
        Venus.firstMaterial?.diffuse.contents = UIImage(named: "\(pickerData[row]).jpg")
        if(pickerData[row] == "Ancient") {
            contextLabel.text = "Ancient Venus"
            contextDescription.text = "Venus wasn't always like this. Long ago, it really was 'Earth's Twin' with surface water, and a habitable condition. A period of intense volcano activity pumped out CO2 turning it to its present phase."
        } else {
            contextLabel.text = "Modern Venus"
            contextDescription.text = "Select any Red Point"
        }
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // Formatting Picker View
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17.0),NSAttributedString.Key.foregroundColor:UIColor.black])
        return myTitle
    }
}
