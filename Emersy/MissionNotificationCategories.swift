import Foundation
import UserNotifications

class MissionNotificationCategories {
    static func get() -> Set<UNNotificationCategory> {
        let acceptAction = UNNotificationAction(identifier: "ACCEPT", title: "ACCEPT", options: [.foreground])
        let refuseAction = UNNotificationAction(identifier: "REFUSE", title: "REFUSE", options: [.destructive, .foreground])
        let missionCategory = UNNotificationCategory(identifier: "MISSION", actions: [acceptAction, refuseAction], intentIdentifiers: [], options: [])
        var categories = Set<UNNotificationCategory>()
        categories.insert(missionCategory)
        return categories
    }
}
