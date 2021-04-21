// Menus.swift

// This file will contain functions that are from ViewController, that are gesture outputs

// Imports
import UIKit
import SceneKit
import ARKit
import QuartzCore
import PlaygroundSupport
import Foundation

extension ViewController {
    
    // Tap Object
    @objc func handleTap(rec: UITapGestureRecognizer){
        let location = rec.location(in: sceneView)
        
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0] 
            let node = result.node
            if(node.name != nil) {
                print(node.name ?? "Falure")
                currentFocus = node.name ?? "E"
                contextRefresh()
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
