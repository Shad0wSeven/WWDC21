import UIKit
import PlaygroundSupport

public struct VenusData {
    var header: String
    var desc: String
    var img: UIImage
}

extension VenusViewController {
public func addData() {
    venusData.append(VenusData(header: "Venera 14 Lander", desc: "The Soviet built Venera 14 was one of the few landers ever launched to Venus, and touched down here, to take this incredible picture, the only one we have of its hellish (overused but accurate adjective) conditions.", img: UIImage(named: "venera.jpg")!))

    venusData.append(VenusData(header: "Maxwell Montes", desc: "The Highest peak on Venus, this entire point barely covers its extent, as it rises almost 11km (7 mi) above the surface of the planet.", img: UIImage(named: "venusmountain.jpg")!))
    
    venusData.append(VenusData(header: "Aphrodite Terra", desc: "One of the large terra or continental regions, the Aphrodite Terra is about half the size of Africa, spanning a large part of Venus.", img: UIImage(named: "Aphrodite.jpg")!))
    
    venusData.append(VenusData(header: "Ishtar Terra", desc: "The smaller of the two major terra, the Ishtar terra ", img: UIImage(named: "ishtar.jpg")!))
    }
}

