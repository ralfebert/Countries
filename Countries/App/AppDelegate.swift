// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        window.rootViewController = UIHostingController(rootView: CountryListView())
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}
