// Menus.swift

// This file will contain functions that are from ViewController, that are used to make changes

// Imports
import UIKit
import SceneKit
import ARKit
import QuartzCore
import PlaygroundSupport
import Foundation

extension ViewController {
    

    
    
    
    // Refresh Earth Image
    func updateEarthImage() {
        // Called Every Time the Earth is refreshed
        let toUpdate = year
        var toUpdateToo: String = ""
        switch currentEarth {
        case "Base":
            if (toUpdate > 2000.0) {
                toUpdateToo = "earth3.jpg"
            } else if (toUpdate > 1901.0) {
                toUpdateToo = "earth2.jpg"
            } else {
                toUpdateToo = "earth1.jpg"
            }
        case "Average Heat":
            if (toUpdate > 2000.0) {
                toUpdateToo = "earth1.jpg"
            } else if (toUpdate > 1901.0) {
                toUpdateToo = "earth3.jpg"
            } else {
                toUpdateToo = "earth2.jpg"
            }
        case "Sea Level":
            if (toUpdate > 2000.0) {
                toUpdateToo = "earth2.jpg"
            } else if (toUpdate > 1901.0) {
                toUpdateToo = "earth1.jpg"
            } else {
                toUpdateToo = "earth3.jpg"
            }
        default:
            print("ERROR")
        } 
        if(currentEarthImage != toUpdateToo) { Earth.firstMaterial?.diffuse.contents = UIImage(named: toUpdateToo) }
        currentEarthImage = toUpdateToo
        
    }
    
    // Tap Object
    @objc func handleTap(rec: UITapGestureRecognizer){
        let location = rec.location(in: sceneView)
        
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0] as! SCNHitTestResult
            let node = result.node
            if(node.name != nil) {
                print(node.name)
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
        self.earthNode.rotation = rotationVector
    }
}
