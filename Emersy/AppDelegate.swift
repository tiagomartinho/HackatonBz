import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        requestAndRegisterForNotifications(application)
        return true
    }

    func requestAndRegisterForNotifications(_ application: UIApplication) {
        requestNotificationsAuthorization()
        application.registerForRemoteNotifications()
    }

    func requestNotificationsAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("requestNotificationsAuthorizationGranted? \(granted)")
        }
        center.setNotificationCategories(MissionNotificationCategories.get())
        center.delegate = self
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
        if response.actionIdentifier == "ACCEPT" {
            print("ACCEPT")
        } else {
            print("REFUSE")
        }
        completionHandler()
    }
}
