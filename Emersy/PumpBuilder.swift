import SwiftyJSON

class PumpBuilder {
    static func build(from json: JSON) -> [Pump] {
        let list: Array<JSON> = json["pumps"].arrayValue
        var pumps = [Pump]()
        for item in list {
            pumps.append(Pump(json: item))
        }
        return pumps
    }
}
