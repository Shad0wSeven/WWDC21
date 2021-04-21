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
    var tableViewAlt: [contextCell] = [contextCell]()
    public override func viewDidLoad() {
        super.viewDidLoad()
            
        // --------------------
        //  Initialization
        // --------------------
        
            
        // TableView 
        tableView.allowsSelection = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        tableView.rowHeight = 150.0
        let firstAssign: contextCell = contextCell(cellText: "", cellImage: UIImage(named: "alert.png")!)
        let secondAssign: contextCell = contextCell(cellText: "Click on any red Point of Interest, spin the globe or change the base image!", cellImage: UIImage(named:"blank.png")!)
        tableViewAlt.append(firstAssign)
        tableViewAlt.append(secondAssign)
        
        // Scene Debug
        sceneView.debugOptions = [
            ARSCNDebugOptions.showWorldOrigin,
            ARSCNDebugOptions.showFeaturePoints
        ]
        self.view.addSubview(sceneView)
        sceneView.delegate = self
        sceneView.showsStatistics = true // This line only works in portrait mode ¯\_(ツ)_/¯
        
        
        
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
        // Make minor adjustments to parentNode here to make it correctly conform to sphere
        
        
        // Create Child Node 1
        let child = SCNSphere(radius: 0.01)
        child.firstMaterial?.diffuse.contents = UIColor.red
        let childNode = SCNNode(geometry: child)
        childNode.name = "P-0"
        childNode.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        sceneView.scene.rootNode.addChildNode(childNode)
        
        
        let childNode14 = SCNNode(geometry: child)
        childNode14.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        sceneView.scene.rootNode.addChildNode(childNode14)
        
        let childNode1 = SCNNode(geometry: child)
        childNode1.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        sceneView.scene.rootNode.addChildNode(childNode1)
        
        let childNode2 = SCNNode(geometry: child)
        childNode1.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        sceneView.scene.rootNode.addChildNode(childNode1)
        
        let childNode3 = SCNNode(geometry: child)
        childNode3.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        sceneView.scene.rootNode.addChildNode(childNode3)
        
        let childNode4 = SCNNode(geometry: child)
        childNode4.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        sceneView.scene.rootNode.addChildNode(childNode4)
        
        let childNode5 = SCNNode(geometry: child)
        childNode5.position = sphereCoord(lat: 0, long: 0, Rad: 0.5)
        sceneView.scene.rootNode.addChildNode(childNode5)
        
        

        


        
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
        pickerData = ["1850", "1900", "2000", "SeaLevel"]
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
        
        contextLabel.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        contextView.addSubview(contextLabel)
        contextLabel.textColor = UIColor.black
        contextLabel.textAlignment = .center
        
        // Description
        
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
        
//          contextRefresh() // Update to normal (DOESN'T WORK ON IPAD FOR SOME REASON!!!)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.autoenablesDefaultLighting = true
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            print("TAPPED")
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
}




