import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        requestNotificationsAuthorization()
        application.registerForRemoteNotifications()
        return true
    }

    func requestNotificationsAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("requestNotificationsAuthorizationGranted? \(granted)")
        }
        center.setNotificationCategories(notificationCategories())
        center.delegate = self
    }

    func notificationCategories() -> Set<UNNotificationCategory> {
        let acceptAction = UNNotificationAction(identifier: "ACCEPT", title: "ACCEPT", options: [.foreground])
        let refuseAction = UNNotificationAction(identifier: "REFUSE", title: "REFUSE", options: [.destructive, .foreground])
        let missionCategory = UNNotificationCategory(identifier: "MISSION", actions: [acceptAction, refuseAction], intentIdentifiers: [], options: [])
        var categories = Set<UNNotificationCategory>()
        categories.insert(missionCategory)
        return categories
    }

    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var token = ""
        for i in 0..<deviceToken.count {
            token += String(format: "%02.2hhx", deviceToken[i] as CVarArg)
        }
        print("deviceToken: \(token)")
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("didReceiveRemoteNotification")
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         didReceive response: UNNotificationResponse,
                                         withCompletionHandler completionHandler: @escaping () -> Void) {
        print("userNotificationCenter")
        completionHandler()
    }
}
