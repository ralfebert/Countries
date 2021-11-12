// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

@main
struct CountriesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoadCountriesView()
            }
        }
    }
}
