import Foundation
import SwiftyJSON

class Pump: NSObject {
    let lng: Double
    let lat: Double
    let elevation: Double
    let pressure: Double
    let tubesBefore: Int

    init(json: JSON) {
        lng = json["lng"].doubleValue
        lat = json["lat"].doubleValue
        elevation = json["elevation"].doubleValue
        pressure = json["pressure"].doubleValue
        tubesBefore = json["tubesBefore"].intValue
    }
}
