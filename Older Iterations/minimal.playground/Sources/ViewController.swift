// ViewController.swift

// This file is to hold the driving UIKit View Controller
// This file has many lines, just due to setting up ARKit and will hopefully be split into modules soon

import UIKit
import SceneKit
import ARKit
import QuartzCore
import PlaygroundSupport
import Foundation



public class ViewController: UIViewController, ARSCNViewDelegate {
    
    // Basic Setup
    let sceneView = ARSCNView(frame: UIScreen.main.bounds) // added 1st line
    
    // --------------------
    //  Global Variables
    // --------------------
    
    // Context Menu
    var contextTitle = "Title "
    var contextDesc = "PLACEHOLDER TEXT: tableView.register(U`ITableViewCell.self, forCellReuseIdentifier:tableView.register(UITableViewCell.self, forCellReuseIdentifier:tableView.register(UITableViewCell.self, forCellReuseIdentifier:tableView.register(UITableViewCell.self, forCellReuseIdentifier:"
    var tableViewData = ["one", "two", "three", "four"]
    
    let tableView = UITableView() // Table that Displays Information
    var currentEarth: String = "Base" // The current Earth Model Shown
    var currentEarthImage: String = "earth1.jpg" // The Current Image for the Current Earth Model Shown
    var currentFocus = "0" // Current Point or Scene Focused
    var earthNode: SCNNode!
    //      var parentNode: SCNNode!
    var year: Float = 1800.0
    let Earth = SCNSphere(radius: 0.5)
    let label = UILabel(frame: CGRect(x: 10, y: 30, width: 180, height: 45))
    let contextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 45))
    let contextDescription = UILabel(frame: CGRect(x: 5, y: 35, width: 290, height: 100))
    var pickerData: [String] = [String]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Setup
        sceneView.debugOptions = [
            ARSCNDebugOptions.showWorldOrigin,
            ARSCNDebugOptions.showFeaturePoints
        ]
        self.view.addSubview(sceneView)
        sceneView.delegate = self
        sceneView.showsStatistics = true // This line doesnt really work idk why
        
        // --------------------
        //  3D View Generation
        // --------------------
        
        // Generate Earth Sphere
        Earth.firstMaterial?.diffuse.contents = UIImage(named: "earth1.jpg")
        let earthNode = SCNNode(geometry: Earth)
        earthNode.position = SCNVector3(x: 0, y: 0, z: 0)
        self.earthNode = earthNode
        sceneView.scene.rootNode.addChildNode(earthNode)
//          addAnimation(node: earthNode)
        
        // Spin!
          let panGest = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
          sceneView.addGestureRecognizer(panGest)
        
        
        // Parent Node for all ChildNodes
        let parentNode = SCNNode(geometry: Earth)
        parentNode.name = "Parent"
        parentNode.position = SCNVector3(x: 0, y: 0, z: 0)
        self.earthNode.addChildNode(parentNode)
        // Make minor adjustments to parentNode here to make it correctly conform to sphere
        
        // Create Child Node 1
        let child = SCNSphere(radius: 0.01)
        child.firstMaterial?.diffuse.contents = UIColor.red
        let childNode = SCNNode(geometry: child)
        childNode.name = "N1"
        childNode.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        parentNode.addChildNode(childNode)
        
        
//         Swift is one of the worst languages I have ever used
          func createNode(lat: Int, long: Int) {
              let child1 = SCNSphere(radius: 0.01)
              child1.firstMaterial?.diffuse.contents = UIColor.red
              let childNode1 = SCNNode(geometry: child)
//              childNode1.name = "N1" // This should be a variable
              childNode1.position = sphereCoord(lat:lat, long:long, Rad: 0.5)
              parentNode.addChildNode(childNode1)
              
          }
          
          createNode(lat: 0, long: 60)
          createNode(lat: 0, long: 90)
          createNode(lat: 0, long: 180)
          createNode(lat: 60, long: 60)
          createNode(lat: 60, long: 90)
          createNode(lat: 60, long: 180)


        
    }


   
    
    // ----------------
    //  Bottom Context
    // ----------------
    




    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.autoenablesDefaultLighting = true
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
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
