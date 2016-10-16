import Alamofire

class AlamofireMissionService {

    typealias Handler = (DefaultDataResponse) -> Void

    let user = "B9A01684-CC3F-48F1-962F-7E477BAE9D95"
    let mission = "6F868381-2A0D-463A-9831-A4A039800090"
    
    func accept(completionHandler: @escaping Handler) {
        request(accepted: true, completionHandler: completionHandler)
    }

    func refuse(completionHandler: @escaping Handler) {
        request(accepted: false, completionHandler: completionHandler)
    }

    func request(accepted: Bool,
                 completionHandler: @escaping Handler) {
        let parameters: Parameters = [
            "accept": accepted
        ]
        Alamofire.request("http://hackathon-emersy.azurewebsites.net/api/v1/mission/6f868381-2a0d-463a-9831-a4a039800090/users/b9a01684-cc3f-48f1-962f-7e477bae9d95",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default).responseJSON { (_) in
                                   Alamofire.request("http://10.171.21.177:9000/enable").response(completionHandler: completionHandler)
        }

    }
}
