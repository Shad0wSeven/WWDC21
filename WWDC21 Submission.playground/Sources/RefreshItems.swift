
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
    }
}
