// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

@MainActor
class CountriesModel: ObservableObject {
    @Published var countries: [Country] = []

    func reload() async {
        let url = URL(string: "https://www.ralfebert.de/examples/v2/countries.json")!
        let urlSession = URLSession.shared

        do {
            let (data, _) = try await urlSession.data(from: url)
            self.countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
        }
    }
}