// ViewController.swift

// This file is to hold the driving UIKit View Controller
// This file has many lines, just due to setting up ARKit and will hopefully be split into modules soon

import UIKit
import SceneKit
import ARKit
import QuartzCore
import PlaygroundSupport
import Foundation


public class ViewController: UIViewController, ARSCNViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Basic Setup
    let sceneView = ARSCNView(frame: UIScreen.main.bounds) // added 1st line
    
    // --------------------
    //  Global Variables
    // --------------------
    
    

    let tableView = UITableView() // Table that Displays Information
    var currentEarth: String = "Base" // The current Earth Model Shown
    var currentEarthImage: String = "earth1.jpg" // The Current Image for the Current Earth Model Shown
    var currentFocus = "0" // Current Point or Scene Focused
    var earthNode: SCNNode!
//      var parentNode: SCNNode!
    var year: Float = 1800.0
    let Earth = SCNSphere(radius: 0.5)
//      let label = UILabel(frame: CGRect(x: 10, y: 30, width: 180, height: 45))
    let contextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 45))
    let contextDescription = UILabel(frame: CGRect(x: 5, y: 35, width: 290, height: 100))
    var pickerData: [String] = [String]()
    var contextTitle = "Title "
    var contextDesc = "PLACEHOLDER TEXT: tableView.register(U`ITableViewCell.self, forCellReuseIdentifier:tableView.register(UITableViewCell.self, forCellReuseIdentifier:tableView.register(UITableViewCell.self, forCellReuseIdentifier:tableView.register(UITableViewCell.self, forCellReuseIdentifier:"
    var tableViewData = ["one", "two", "three", "four"]
    
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
        
        // Tap Action
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.addTarget(self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tap)
        
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
        
        func createNode(lat: Int, long: Int, names: String) {
            let child1 = SCNSphere(radius: 0.01)
            child1.firstMaterial?.diffuse.contents = UIColor.red
            let childNode1 = SCNNode(geometry: child)
            childNode1.name = names // This should be a variable
            childNode1.position = sphereCoord(lat:lat, long:long, Rad: 0.5)
            parentNode.addChildNode(childNode1)
            
        }
        createNode(lat: 0, long: 60, names: "AAA")
        createNode(lat: 10, long: 60, names: "BBB")

        
        // --------------
        //  Top Controls
        // --------------

        // Generate View Behind 
        let rect = CGRect(x: 10, y: 10, width: 200, height: 80)
        let backLabelView = UIView(frame: rect)
        backLabelView.backgroundColor = .white
        backLabelView.layer.cornerRadius = 10
        self.sceneView.addSubview(backLabelView)
        
        // Spin!
        let panGest = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        backLabelView.addGestureRecognizer(panGest)
        
        // UI Picker
        pickerData = ["a", "b", "c", "d", "e", "f", "g"]
        let UIPicker: UIPickerView = UIPickerView()
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        UIPicker.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        backLabelView.addSubview(UIPicker)

        
        // --------------------
        //  Bottom Context Menu
        // --------------------
        
        // Background
        let contextRect = CGRect(x: 10, y: 100 , width: 300, height: 440)
        let contextView = UIView(frame: contextRect)
        contextView.backgroundColor = .white
        contextView.layer.cornerRadius = 10
        self.sceneView.addSubview(contextView)
        
        // Title
        contextLabel.text = contextTitle
        contextLabel.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        contextView.addSubview(contextLabel)
        contextLabel.textColor = UIColor.black
        contextLabel.textAlignment = .center
        
        // Description
        contextDescription.text = contextDesc
        contextDescription.font = UIFont.systemFont(ofSize: 15, weight: .light)
        contextDescription.textColor = .black
        contextDescription.textAlignment = .left
        contextDescription.numberOfLines = 0
        contextView.addSubview(contextDescription)
        
        // Table View
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 140, width: 290, height: 290)
        contextView.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.autoenablesDefaultLighting = true
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
}




