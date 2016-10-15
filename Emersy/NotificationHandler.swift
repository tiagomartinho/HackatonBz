import Alamofire
import SwiftyJSON

class NotificationHandler {
    func handle(with identifier: String, withCompletionHandler completionHandler: @escaping () -> Void) {
        if identifier == "ACCEPT" {
            print("ACCEPT")
        } else {
            print("REFUSE")
        }
        completionHandler()
    }
}
