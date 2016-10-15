class AcceptNotificationHandler: NotificationHandler {
    func handle(withCompletionHandler completionHandler: @escaping () -> Void) {
        print("ACCEPT")
        completionHandler()
    }
}
