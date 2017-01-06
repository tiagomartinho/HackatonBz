import SwiftyJSON

class PumpsServiceOutput {
    static func build(from json: JSON) -> (SourcePump, [Pump], Distributor) {
        let list: Array<JSON> = json["pumps"].arrayValue
        var pumps = [Pump]()
        for item in list {
            pumps.append(Pump(json: item))
        }
        let sourcePump = SourcePump(json: json["pumpAtWaterSource"])
        let distributor = Distributor(json: json["distributor"])
        return (sourcePump, pumps, distributor)
    }
}
