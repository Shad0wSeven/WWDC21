
// This file was created beacuse playgrounds are buggy messes

import UIKit
import SceneKit

public struct locationsNames {
    let locations: SCNVector3
    let name: String
}

public func POI(view: Int) {
    
    switch view {
    

    // Views
    // Main View - 0
    /*
     1 - Blackouts (NYC)
     2 - Allergies (Health Risks)
     3 - Food Shortages (Growing/Weather)
     4 - Water Quality (Worse Conditions)
     5 - Travel Disruptions (Water Depletion)
     */
    case 0:
        toPlace.removeAll()
        toPlace.append(locationsNames(locations: sphereCoord(lat: 40, long: -70, Rad: 0.5), name: "P*0*NYC"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 32, long: -100, Rad: 0.5), name: "P*0*ALG"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 42, long: -105, Rad: 0.5), name: "P*0*FS"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 45, long: -120, Rad: 0.5), name: "P*0*WQ"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 60, long: 0, Rad: 0.5), name: "P*0*LON"))
    // Sea Level - 1
    /*
     1 - Great Barrier Reef (Acidification)
     2 - Glacial Retreat - (Polar Ice)
     3 - Arctic Ice (Polar Ice)
     4 - Shellfish Corals (Acidification)
     5 - Wetland Destruction (Sea Level Rise)
     */
    case 1:
        toPlace.removeAll()
        toPlace.append(locationsNames(locations: sphereCoord(lat: -40, long: 150, Rad: 0.5), name: "P*1*GBR"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 70, long: -60, Rad: 0.5), name: "P*1*PLI"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 80, long: 0, Rad: 0.5), name: "P*1*ARI"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: -20, long: -80, Rad: 0.5), name: "P*1*SFC"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 28, long: -84, Rad: 0.5), name: "P*1*WTD"))
    // Temperature Increase - 2
    /*
     1 - Alaska (Cause/Hottest Year)
     2 - Lake Superior (Warming/Drying up)
     3 - Animal Extinction (Migration) [1/2 of plants, 1/3 of animals]
     4 - Growing Season (Midwest US)
     5 - Ozone Depletion (Cosmic Rays)
     */
    case 2:
        toPlace.removeAll()
        toPlace.append(locationsNames(locations: sphereCoord(lat: 60, long: -150, Rad: 0.5), name: "P*2*ALK"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 47, long: -87, Rad: 0.5), name: "P*2*LKS"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: -20, long: -60, Rad: 0.5), name: "P*2*ANE"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 42, long: -105, Rad: 0.5), name: "P*2*GWS"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: -80, long: 0, Rad: 0.5), name: "P*2*OZD"))
    // Extreme Events - 3
    /*
     1 - Hurricanes (Haiyan Phillipines)
     2 - Lightning Strikes
     3 - Polar Jets (Causes)
     4 - Heatwaves/Droughts (South Africa)
     5 - Flooding (Bangladesh)
     */
    case 3:
        toPlace.removeAll()
        toPlace.append(locationsNames(locations: sphereCoord(lat: 20, long: 120, Rad: 0.5), name: "P*3*HUR"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 42, long: -120, Rad: 0.5), name: "P*3*LIS"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 80, long: -30, Rad: 0.5), name: "P*3*POJ"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 30, long: -35, Rad: 0.5), name: "P*3*HWD"))
        toPlace.append(locationsNames(locations: sphereCoord(lat: 20, long: 90, Rad: 0.5), name: "P*3*FLD"))
    default:
        print("FATAL ERROR")
    }
}
