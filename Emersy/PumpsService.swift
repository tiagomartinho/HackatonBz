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
                                print("JSON: \(json)")
                            case .failure(let error):
                                print(error)
                            }
                            completionHandler(response)
        }
    }
}
