
// ViewController.swift

// This file is to hold the driving UIKit View Controller
// This file has many lines, just due to setting up ARKit and will hopefully be split into modules soon

import UIKit
import SceneKit
import ARKit
import QuartzCore
import PlaygroundSupport
import Foundation


public class VenusViewController: UIViewController, ARSCNViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Basic Setup
    let sceneView = ARSCNView(frame: UIScreen.main.bounds) // added 1st line
    
    // --------------------
    //  Global Variables
    // --------------------
    var venusData = [VenusData]()
    var currentFocus = "0" // Current Point or Scene Focused
    var venusNode: SCNNode!
    let Venus = SCNSphere(radius: 0.5)
    var contextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 45))
    var contextDescription = UILabel(frame: CGRect(x: 5, y: 35, width: 290, height: 100))
    var contextImage = UIImageView()
    let pickerData = ["Atmosphere", "Land", "Ancient"]
    public override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        // --------------------
        //  Initialization
        // --------------------

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
        Venus.firstMaterial?.diffuse.contents = UIImage(named: "Atmosphere.jpg")
        let venusNode = SCNNode(geometry: Venus)
        venusNode.position = SCNVector3(x: 0, y: 0, z: 0)
        self.venusNode = venusNode
        sceneView.scene.rootNode.addChildNode(venusNode)
        
        // Tap Action
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.addTarget(self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tap)
        
        func createNode(lat: Int, long: Int, names: String) {
            let child1 = SCNSphere(radius: 0.01)
            child1.firstMaterial?.diffuse.contents = UIColor.red
            let childNode1 = SCNNode(geometry: child1)
            childNode1.name = names // This should be a variable
            childNode1.position = sphereCoord(lat:lat, long:long, Rad: 0.5)
            self.venusNode.addChildNode(childNode1)
            
        }
        createNode(lat: 0, long: 60, names: "P-1")
        createNode(lat: 10, long: 60, names: "P-2")
        
        
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
        
        // Image View
        contextImage.image = UIImage(named: "earth1.jpg")
        let frame = CGRect(x: 0, y: 140, width: ((contextImage.image?.size.width ?? 3) / 3), height: ((contextImage.image?.size.height ?? 3) / 3))
        contextImage.frame = frame
//          contextImage.contentMode = 
        contextView.addSubview(contextImage)
        
        // Initial Initialization
        contextDescription.text = "Venus is what our Earth could become. . ."
        contextLabel.text = "Modern Venus"
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.autoenablesDefaultLighting = true
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
    }
}





