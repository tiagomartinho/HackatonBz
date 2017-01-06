import SwiftyJSON

class PumpsServiceOutput {
    static func build(from json: JSON) -> (SourcePump,[Pump]) {
        let list: Array<JSON> = json["pumps"].arrayValue
        var pumps = [Pump]()
        for item in list {
            pumps.append(Pump(json: item))
        }
        let sourcePump = SourcePump(json: json["pumpAtWaterSource"])
        return (sourcePump, pumps)
    }
}
