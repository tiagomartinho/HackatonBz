import Foundation
import SwiftyJSON

class Distributor: NSObject {

    let lat: Double
    let lng: Double
    let elevation: Double
    let distanceBefore: Double
    let tubesBefore: Int
    let pressure: Double
    let flowRate: Double

    init(json: JSON) {
        lat = json["lat"].doubleValue
        lng = json["lng"].doubleValue
        elevation = json["elevation"].doubleValue
        distanceBefore = json["distanceBefore"].doubleValue
        tubesBefore = json["tubesBefore"].intValue
        pressure = json["pressure"].doubleValue
        flowRate = json["flowRate"].doubleValue
    }
}
