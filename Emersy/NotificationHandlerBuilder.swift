class NotificationHandlerBuilder {
    static func build(with identifier: String) -> NotificationHandler {
        if identifier == "ACCEPT" {
            return AcceptNotificationHandler()
        } else {
            return RefuseNotificationHandler()
        }
    }
}
