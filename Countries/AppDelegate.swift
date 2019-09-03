// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Globales Styling via UINavigationBarAppearance / UITabBarAppearance / UIToolbarAppearance

        if #available(iOS 13.0, *) {
            let navBarStandardAppearance = UINavigationBarAppearance()
            navBarStandardAppearance.backgroundColor = .blue
            navBarStandardAppearance.titleTextAttributes = [.foregroundColor: UIColor.yellow]
            UINavigationBar.appearance().standardAppearance = navBarStandardAppearance

            let navBarScrollEdgeAppearance = UINavigationBarAppearance()
            navBarScrollEdgeAppearance.backgroundColor = .yellow
            UINavigationBar.appearance().scrollEdgeAppearance = navBarScrollEdgeAppearance

            let navBarCompactAppearance = UINavigationBarAppearance()
            navBarCompactAppearance.backgroundColor = .red
            UINavigationBar.appearance().compactAppearance = navBarCompactAppearance

            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .orange
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }

        return true
    }

}
