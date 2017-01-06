import Alamofire
import SwiftyJSON

class PumpsService {

    typealias completionHandler = (SourcePump?,[Pump]?, Distributor?) -> Void

    func send(input: PumpsServiceInput, completionHandler: @escaping completionHandler) {
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
                                let (sourcePump, pumps, distributor) = PumpsServiceOutput.build(from: json)
                                completionHandler(sourcePump, pumps, distributor)
                            case .failure(let error):
                                print(error)
                                completionHandler(nil, nil, nil)
                            }
        }
    }
}
