import Foundation
import SwiftyJSON

class Pump: NSObject {

    let lat: Double
    let lng: Double
    let elevation: Double
    let distanceBefore: Double
    let tubesBefore: Int
    let inputPressure: Double
    let outputPressure: Double
    let flowRate: Double

    init(json: JSON) {
        lat = json["lat"].doubleValue
        lng = json["lng"].doubleValue
        elevation = json["elevation"].doubleValue
        distanceBefore = json["distanceBefore"].doubleValue
        tubesBefore = json["tubesBefore"].intValue
        inputPressure = json["inputPressure"].doubleValue
        outputPressure = json["outputPressure"].doubleValue
        flowRate = json["flowRate"].doubleValue
    }
}
