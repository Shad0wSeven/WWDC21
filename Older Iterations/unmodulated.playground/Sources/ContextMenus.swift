
// ContextMenus.swift

// This file is to hold and display data for contextMenus
import UIKit


// Note:
// I understand this is like the worst way to hold code, JSON or anything would be much much better, but that is just too much work right now, and this isn't that bad with alot of cmd-c cmd-v although if this were on written iPad I would definetly go JSON

let blank: contextCell = contextCell(cellText: "Click on any red Point of Interest, spin the globe or change the base image!", cellImage: UIImage(named:"blank.png")!)

//  Return Struct
public struct contextQuery {
    var title: String
    var desc: String
    var tableData: [contextCell] = [contextCell]()
    public init(title:String, desc:String, tableData:[contextCell]) {
        self.title = title
        self.desc = desc
        self.tableData = tableData
    }
}

// Query Format

// First Character - Subgroup
/*
 d = Datatype
 p = Point of Interest
 vp = Venus POI
 vd = Venus Datatype
 */

// Second Character - Identifier (For POI there are two)
/*
 d-SeaLevel = Datatype Sea Level
 p-Spain-Fortress = POI Spain Fortress
 
 */


public func returnContext(query: String) -> contextQuery {
    var queryAnswer: contextQuery = contextQuery(title: "<NULL>", desc: "<NULL>", tableData: [])
    let queryArray = query.components(separatedBy: "-")
    switch queryArray[0] {
    case "0":
        queryAnswer.title = "Nothing Selected!"
        queryAnswer.desc = "Tap an object or change a view to get a selection!"
        queryAnswer.tableData.append(contextCell(cellText: "Click on any red Point of Interest, spin the globe or change the base image!", cellImage: UIImage(named:"blank.png")!))
    case "E":
        queryAnswer.title = "ERROR ENCOUNTERED"
        queryAnswer.desc = "An Error was Encountered!!!"
        queryAnswer.tableData = [contextCell(cellText: "ERR!", cellImage: UIImage(named:"blank.png")!)]
    case "D":
        queryAnswer = returnDescriptorContext(query: queryArray[1])
    case "P":
        queryAnswer.title = "UNKNOWN POI SELECTED"
        queryAnswer.desc = "NOTHING TO DISPLAY"
        queryAnswer.tableData = [contextCell(cellText: "An Unknown POI was selected!!!", cellImage: UIImage(named:"blank.png")!)]
    default:
        queryAnswer.title = "ERROR"
        queryAnswer.desc = "ERROR"
        queryAnswer.tableData = [] 
    }
    return queryAnswer
    
}


public func returnDescriptorContext(query: String) -> contextQuery {
    var queryAnswer: contextQuery = contextQuery(title: "<NULL>", desc: "<NULL>", tableData: [])
    switch query {
        case "1850":
            queryAnswer.title = "The 1800's"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = [contextCell(cellText: "1850 Year", cellImage: UIImage(named:"blank.png")!)]
        case "1900":
            queryAnswer.title = "The 1900's"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = [contextCell(cellText: "1950 Year", cellImage: UIImage(named:"blank.png")!)]
        case "2000":
            queryAnswer.title = "The 2000's"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = [contextCell(cellText: "2050 Year", cellImage: UIImage(named:"blank.png")!)]
        case "SeaLevel":
            queryAnswer.title = "The SeaLevel"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = [contextCell(cellText: "Sealevel", cellImage: UIImage(named:"blank.png")!)] 
        default:
            queryAnswer.title = "ERROR"
            queryAnswer.desc = "ERROR"
            queryAnswer.tableData = [] 
    }
    return queryAnswer
}

