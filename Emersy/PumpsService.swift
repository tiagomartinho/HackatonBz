import Alamofire

class PumpsService {
    func send(input: PumpsServiceInput) {
        let url = "http://10.171.21.177:8080/pumpLocation"
        Alamofire.request(url,
                          method: .post,
                          parameters: input.serialized(),
                          encoding: JSONEncoding.default).response { (response) in
                            print(response.response?.statusCode)
        }
    }
}
