
// ContextMenus.swift

// This file is to hold and display data for contextMenus
import UIKit


//  Return Struct
public struct contextQuery {
    var title: String
    var desc: String
    var tableData: [String]
    public init(title:String, desc:String, tableData:[String]) {
        self.title = title
        self.desc = desc
        self.tableData = tableData
    }
}

// Query Format

// First Character - Subgroup
/*
 y = Year
 d = Datatype
 p = Point of Interest
 */

// Second Character - Identifier (For POI there are two)
/*
 y-1992 = Year 1992
 d-SeaLevel = Datatype Sea Level
 p-Spain-Fortress = POI Spain Fortress
 
 */


public func returnContext(query: String) -> contextQuery {
    var queryAnswer: contextQuery = contextQuery(title: "<NULL>", desc: "<NULL>", tableData: ["<NULL>","<NULL>","<NULL>"])
    let queryArray = query.components(separatedBy: "-")
    switch queryArray[1] {
    case "y":
        switch queryArray[2] {
        case "1850":
            queryAnswer.title = "The 1800's"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = ["ERROR", "ERROR"]
        case "1900":
            queryAnswer.title = "The 1900's"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = ["ERROR", "ERROR"]
        case "2000":
            queryAnswer.title = "The 2000's"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = ["ERROR", "ERROR"]
        default:
            queryAnswer.title = "ERROR"
            queryAnswer.desc = "ERROR"
            queryAnswer.tableData = ["ERROR", "ERROR"]
        }
        
    case "d":
        switch queryArray[2] {
        case "SeaLevel":
            queryAnswer.title = "The SeaLevel"
            queryAnswer.desc = "Were a Great Time"
            queryAnswer.tableData = ["ERROR", "ERROR"] 
        default:
            queryAnswer.title = "ERROR"
            queryAnswer.desc = "ERROR"
            queryAnswer.tableData = ["ERROR", "ERROR"] 
        }
        
    case "p":
        queryAnswer.title = "ERRORP"
        queryAnswer.desc = "ERROR"
        queryAnswer.tableData = ["ERROR", "ERROR"]
    default:
        queryAnswer.title = "ERROR"
        queryAnswer.desc = "ERROR"
        queryAnswer.tableData = ["ERROR", "ERROR"] 
    }
    return queryAnswer
    
}


