class AcceptNotificationHandler: NotificationHandler {

    func handle(withCompletionHandler completionHandler: @escaping () -> Void) {
        print("ACCEPT")
        AlamofireMissionService().accept { (response) in
            print("response status code: \(response.response?.statusCode)")
            completionHandler()
        }
    }
}
