class RefuseNotificationHandler: NotificationHandler {
    func handle(withCompletionHandler completionHandler: @escaping () -> Void) {
        print("REFUSE")
        AlamofireMissionService().refuse { (response) in
            print("response status code: \(response.response?.statusCode)")
            completionHandler()
        }
    }
}
