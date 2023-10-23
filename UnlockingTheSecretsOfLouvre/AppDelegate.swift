//
//  AppDelegate.swift
//  UnlockingTheSecretsOfLouvre
//
//  Created by Cenker Soyak on 23.10.2023.
//

import UIKit
import FirebaseCore
import FirebaseDynamicLinks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        if let incomingURL = userActivity?.webpageURL {
            let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: incomingURL)
            if let link = dynamicLink {
                print("\(link)")
            }
        }
        return true
    }
}

