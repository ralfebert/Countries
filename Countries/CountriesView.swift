// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

class CountriesModel: ObservableObject {

    @Published var countries: [Country] = []

    func reload() {
        let url = URL(string: "https://www.ralfebert.de/examples/v2/countries.json")!

        let urlSession = URLSession.shared

        let task = urlSession.dataTask(with: url) { data, _, error in
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            guard let data = data else {
                debugPrint("Error loading \(url): \(String(describing: error))")
                return
            }

            // Parse JSON with JSONDecoder assuming valid JSON data
            let countries = try! JSONDecoder().decode([Country].self, from: data)

            // Update UI
            OperationQueue.main.addOperation {
                self.countries = countries
            }
        }

        task.resume()
    }

}

struct CountriesView: View {
    @StateObject var countriesModel = CountriesModel()

    var body: some View {
        List(countriesModel.countries) { country in
            Text(country.name)
        }
        .onAppear {
            self.countriesModel.reload()
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
