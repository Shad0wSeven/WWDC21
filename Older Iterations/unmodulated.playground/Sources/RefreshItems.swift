
// RefreshItems.swift

// This file will contain functions that are from ViewController, that are used to refresh things like the context menu and background image

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
        case "a":
            toUpdateToo = "earth1.jpg"
        case "b":
            toUpdateToo = "earth2.jpg"
        case "c":
            toUpdateToo = "earth3.jpg"
        default:
            print("ERROR")
            toUpdateToo = "earth1.jpg"
        } 
        if(currentEarthImage != toUpdateToo) { Earth.firstMaterial?.diffuse.contents = UIImage(named: toUpdateToo) }
        currentEarthImage = toUpdateToo
    }
    
    // Refresh Context
    func contextRefresh() {
        // Called Every Time the ContextView is Refreshed
        let queryAnswer: contextQuery = returnContext(query: currentFocus)
        contextLabel.text = queryAnswer.title
        contextDescription.text = queryAnswer.desc
        tableViewAlt.removeAll()
        for item in queryAnswer.tableData {
            tableViewAlt.append(item)
        }
        tableView.reloadData()
        // TODO: Fix TABLE
    }
}
