protocol NotificationHandler {
    func handle(withCompletionHandler completionHandler: @escaping () -> Void)
}
