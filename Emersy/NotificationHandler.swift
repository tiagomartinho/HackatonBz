protocol NotificationHandler {
    func handle(withCompletionHandler completionHandler: @escaping () -> Void)
}

class AcceptNotificationHandler: NotificationHandler {
    func handle(withCompletionHandler completionHandler: @escaping () -> Void) {
        print("ACCEPT")
        completionHandler()
    }
}

class RefuseNotificationHandler: NotificationHandler {
    func handle(withCompletionHandler completionHandler: @escaping () -> Void) {
        print("REFUSE")
        completionHandler()
    }
}

class NotificationHandlerBuilder {
    static func build(with identifier: String) -> NotificationHandler {
        if identifier == "ACCEPT" {
            return AcceptNotificationHandler()
        } else {
            return RefuseNotificationHandler()
        }
    }
}
