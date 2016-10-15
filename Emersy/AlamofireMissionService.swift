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
        Alamofire.request("https://httpbin.org/post",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default).response(completionHandler: completionHandler)
    }
}
