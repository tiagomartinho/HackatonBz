import Alamofire
import SwiftyJSON

class NotificationHandler {
    func handle(with identifier: String) {
        if identifier == "ACCEPT" {
            print("ACCEPT")
        } else {
            print("REFUSE")
        }
    }
}
