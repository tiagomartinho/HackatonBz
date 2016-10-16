import Alamofire
import SwiftyJSON

class PumpsService {
    func send(input: PumpsServiceInput, completionHandler: @escaping (DataResponse<Any>) -> Void) {
        let url = "http://10.171.21.177:8080/pumpLocation"
        let json = JSON(input.serialized())
        print("input JSON: \(json)")
        Alamofire.request(url,
                          method: .post,
                          parameters: input.serialized(),
                          encoding: JSONEncoding.default).responseJSON { (response) in
                            switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                let pumps = PumpBuilder.build(from: json)
                                for pump in pumps {
                                    print(pump)
                                }
                            case .failure(let error):
                                print(error)
                            }
                            completionHandler(response)
        }
    }
}

struct Pump {
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
