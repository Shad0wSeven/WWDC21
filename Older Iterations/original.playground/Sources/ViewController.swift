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
//          let panGest = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
//          sceneView.addGestureRecognizer(panGest)
        
        // Tap
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
        
        
        // God Whoever made this language and frameworks should be shot
        let child1 = SCNSphere(radius: 0.01)
        child.firstMaterial?.diffuse.contents = UIColor.red
        let childNode1 = SCNNode(geometry: child1)
        childNode1.position = sphereCoord(lat: 60, long: 0, Rad: 0.5)
        self.earthNode.addChildNode(childNode1)
        

    //         Swift is one of the worst languages I have ever used
        func createNode(lat: Int, long: Int) {
            let child1 = SCNSphere(radius: 0.01)
            child1.firstMaterial?.diffuse.contents = UIColor.red
            let childNode1 = SCNNode(geometry: child)
            // childNode1.name = "N1" // This should be a variable
            childNode1.position = sphereCoord(lat:lat, long:long, Rad: 0.5)
            parentNode.addChildNode(childNode1)
              
          }
          
          createNode(lat: 0, long: 60)
          createNode(lat: 0, long: 90)
          createNode(lat: 0, long: 180)
          createNode(lat: 60, long: 60)
          createNode(lat: 60, long: 90)
          createNode(lat: 60, long: 180)

        
        // --------------
        //  Top Controls
        // --------------
//
//        // Generate View Behind 
//        let rect = CGRect(x: 10, y: 10, width: 200, height: 80)
//        let backLabelView = UIView(frame: rect)
//        backLabelView.backgroundColor = .white
//        backLabelView.layer.cornerRadius = 10
//        self.sceneView.addSubview(backLabelView)
//        
//        // UI Label (test)
//        label.font = UIFont.systemFont(ofSize: 17.0, weight: .medium)
//        label.textColor = UIColor.black
//        label.textAlignment = .center
//        backLabelView.addSubview(label)
//
//        // UI Slider
//        let yearSlider = UISlider(frame: CGRect(x: 250, y: 0, width: 300, height: 70))
////          yearSlider.center = self.sceneView.center // TODO: Move this to the bottom!
//        self.sceneView.addSubview(yearSlider)
//        yearSlider.minimumValue = 1850
//        yearSlider.maximumValue = 2021
//        yearSlider.isContinuous = true
//        yearSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
//        
//        // Set Initial Text
//        label.text = "The Year is: \(String(Int(yearSlider.value)))"
//        
//        // UIPickerView
//        pickerData = ["Base", "Average Heat", "Sea Level"]
//        let pickerView: UIPickerView = UIPickerView()
//        pickerView.dataSource = self
//        pickerView.delegate = self
//        pickerView.frame = CGRect(x: 10, y: 0, width: 200, height: 60)
//        self.sceneView.addSubview(pickerView)
        
        
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
//          contextLabel.font = UIFont.systemFont(ofSize: 25.0)
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
        
        
        // End of ViewDidLoad
    }

    
    // ------------------------
    //  Picker View Formatting
    // ------------------------
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return pickerData.count }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return pickerData[row] }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // On Select of Picker View
        if(currentEarth != pickerData[row]) {
            currentEarth = pickerData[row]
            updateEarthImage()
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // Formatting Picker View
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17.0),NSAttributedString.Key.foregroundColor:UIColor.black])
        return myTitle
    }
    
    
    // ----------------
    //  Slider Actions
    // ----------------

    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began: break
            // handle drag began
            case .moved: break
//                  updateYearLabel(toUpdate: slider.value)
            case .ended:
            // handle drag end
                year = slider.value
                updateYearLabel(toUpdate: slider.value)
                updateEarthImage()
            default:
                break
            }
        }
    }
    
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
    
    func updateYearLabel(toUpdate: Float) {
        label.text = "The Year is: \(String(Int(toUpdate)))"
    }

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
    @objc func handleTap(rec: UITapGestureRecognizer){
//          print("Tapped")
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

}

extension ViewController {
    // Extensions here...
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = tableViewData[indexPath.row]
        return cell
    }
    
}
