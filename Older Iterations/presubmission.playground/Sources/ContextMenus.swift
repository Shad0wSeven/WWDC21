
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
    let queryArray = query.components(separatedBy: "*")
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
        queryAnswer = returnPOIContext(num: queryArray[1], query: queryArray[2])
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
        case "Earth":
            queryAnswer.title = "The Earth"
            queryAnswer.desc = "This is a base map of the Earth. While nothing interesting is on it, it's a good way to click on the rest of the points of interest. If you want, you can switch to any other view with the picker above, or tap any red dot for more information."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"earthgreat.jpg")!),contextCell(cellText: "As we got further and further away, it [the Earth] diminished in size. Finally it shrank to the size of a marble, the most beautiful you can imagine. That beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart.", cellImage: UIImage(named:"blank.png")!)]
                // ADD IMAGES OF THE EARTH
        case "Country-Performance":
            queryAnswer.title = "Country Performance"
            queryAnswer.desc = "This is a measure of how well each country is doing in terms of emissions and their impact on global warming . . . yeah most countries save for Scandinavia are doing really bad. . ."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"fossil_fuels_trends.jpg")!), contextCell(cellText: "", cellImage: UIImage(named:"countryemissions.jpg")!)]
                // TRENDS HERE
        case "Future-Sealevel":
            queryAnswer.title = "The World in 2100"
            queryAnswer.desc = "This is a map of how the world would look in 2100 with current climate trends. . . Florida's missing so that's a plus (JK), however so is the California Coastline :(."
            queryAnswer.tableData = [contextCell(cellText: "In all seriousness really the world changes to a drastically different place, knocking out and displacing millions, as well as with countless environmental detriments.", cellImage: UIImage(named:"blank.png")!)]
        case "Greenhouse-Gas":
            queryAnswer.title = "Greenhouse Gasses"
            queryAnswer.desc = "This NASA Map shows the movement and release of key greenhouse gasses such as Carbon Dioxide and Monoxide, as well as CFC's."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"globalgas.jpg")!)] 
        case "Ocean-Acidification":
            queryAnswer.title = "Acidic Oceans"
            queryAnswer.desc = "This map shows the trends in the acidification of the oceans."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"acidocean.jpg")!), contextCell(cellText: "As more carbon dioxide gets released into the atmosphere, the oceans, as they always have, absorb much of it, which leaves the planet a bit colder, but also drives up the acidification of the ocean, leading to massive changes for the trillions of creatures that inhabit it.", cellImage: UIImage(named:"blank.png")!)] 
        case "Ocean-Temperature":
            queryAnswer.title = "Ocean Temperatures"
            queryAnswer.desc = "This map shows the how the average temperature of the ocean is increasing over time."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"oceanrisingheat.jpg")!),contextCell(cellText: "Like it does with CO2 absorption by the ocean is a way that alot of heat is lost from the earth, however rising ocean temperatures are not a good thing at all.", cellImage: UIImage(named:"blank.png")!)] 
        case "Sealevel-Change":
            queryAnswer.title = "Sealevel Change"
            queryAnswer.desc = "While the other map shows a striking map of the future, this shows the present, and how the sealevel is changing currently."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"sealevel.jpg")!)] 
        case "Snowcover":
            queryAnswer.title = "Glaciers and Snow"
            queryAnswer.desc = "One of the most important factors in contributing to Sealevel increases is glaciers and snow melting."
            queryAnswer.tableData = [contextCell(cellText: "Since the early 1900s, many glaciers around the world have been rapidly melting. Human activities are at the root of this phenomenon. Specifically, since the industrial revolution, carbon dioxide and other greenhouse gas emissions have raised temperatures, even higher in the poles, and as a result, glaciers are rapidly melting, calving off into the sea and retreating on land.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"glacierssad.jpg")!)] 
        case "Temp-2000":
            queryAnswer.title = "Temperature in 2000"
            queryAnswer.desc = "This map shows the temperature at the beginning of the millenium, pretty bad, but it gets worse."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"blank.png")!)]
        case "Temp-2021":
            queryAnswer.title = "Current Temperatures"
            queryAnswer.desc = "This is the current temperatures in 2021, which have risen significantly since 2000"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"blank.png")!)] 
        case "Temperature-Increase":
            queryAnswer.title = "Temperature Increase"
            queryAnswer.desc = "This is a temperature increase over time, rather than just two maps, which I think is easier to understand. The graph below is the famous 'Hockey Stick' Graph. These trends speak for themselves."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"hockeystick.jpg")!)] 
        case "Ozone":
            queryAnswer.title = "The Ozone Layer"
            queryAnswer.desc = "With CFC's being released, one of the major impacts is on the ozone layer, which protects us from deadly UV Rays. Luckily, by banning products that contribute to it's depletion we are slowly getting our ozone hole back."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"ozonehole.jpg")!)] 
        default:
            queryAnswer.title = "ERROR"
            queryAnswer.desc = "ERROR"
            queryAnswer.tableData = [] 
    }
    return queryAnswer
}

