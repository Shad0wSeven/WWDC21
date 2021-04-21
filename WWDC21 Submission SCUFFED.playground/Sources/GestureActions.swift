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
    @objc func handleTap(sender: UITapGestureRecognizer){
        let location = sender.location(in: sceneView)
        let results = sceneView.hitTest(location, options: nil)
        if results.count > 0 {
            let result = results[0] 
            let node = result.node
            if(node.name != nil) {
                print(node.name ?? "Failure")
                currentFocus = node.name ?? "E"
                contextRefresh()
            }

        }
    }
    
    // Pan Earth
    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        let modify = gestureRecognizer.translation(in: gestureRecognizer.view!)
        let x = Float(modify.x)
        let y = Float(-modify.y)
        let Panned = (sqrt(pow(x,2)+pow(y,2)))*(Float)(Double.pi)/180.0
        var rotationVector = SCNVector4()
        rotationVector.x = x
        rotationVector.y = y
        rotationVector.z = 0.0
        rotationVector.w = Panned
        self.earthNode.rotation = rotationVector
    }
}
