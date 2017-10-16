//
//  AppDelegate.swift
//  notification-word
//
//  Created by Takashima on 2017/09/01.
//  Copyright © 2017年 takattata. All rights reserved.
//

import UIKit
import UserNotifications

import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        setupNotification()
        updateNotifications()
        setupThirdParty()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        updateNotifications()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

extension AppDelegate {
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
    }

    private func updateNotifications() {
        ///FIXME: 前回開いた日付比較して日にちが新しくなっているなら通知1ヶ月分更新する.
    }

    private func setupThirdParty() {
        FirebaseApp.configure()
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    private func setupNotification() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (accepted, error) in
            if !accepted {
                print("Notification access has been denied")
            }
        }
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
