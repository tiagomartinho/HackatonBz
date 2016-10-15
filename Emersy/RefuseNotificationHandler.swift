class RefuseNotificationHandler: NotificationHandler {
    func handle(withCompletionHandler completionHandler: @escaping () -> Void) {
        print("REFUSE")
        completionHandler()
    }
}
