import Foundation
import SwiftyJSON

class SourcePump: NSObject {

    let lat: Double
    let lng: Double
    let outputPressure: Double
    let flowRate: Double

    init(json: JSON) {
        lat = json["lat"].doubleValue
        lng = json["lng"].doubleValue
        outputPressure = json["outputPressure"].doubleValue
        flowRate = json["flowRate"].doubleValue
    }
}
