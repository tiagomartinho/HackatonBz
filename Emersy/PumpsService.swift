import Alamofire
import SwiftyJSON

class PumpsService {
    func send(input: PumpsServiceInput, completionHandler: @escaping ([Pump]?) -> Void) {
        let url = "http://test-emersy.azurewebsites.net/api/v1/pumpcircuits"
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
                                completionHandler(pumps)
                            case .failure(let error):
                                print(error)
                                completionHandler(nil)
                            }
        }
    }
}
