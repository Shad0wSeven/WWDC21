import UIKit
import PlaygroundSupport

public struct VenusData {
    var header: String
    var desc: String
    var img: UIImage
}

extension VenusViewController {
public func addData() {
    venusData.append(VenusData(header: "yay0", desc: "yay", img: UIImage(named: "earth2.jpg")!))

    venusData.append(VenusData(header: "yay1", desc: "yay", img: UIImage(named: "earth2.jpg")!))
    
    venusData.append(VenusData(header: "yay2", desc: "yay", img: UIImage(named: "earth2.jpg")!))
    }
}

