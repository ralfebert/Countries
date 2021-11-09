// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI
import AsyncModel

@MainActor
class CountriesModel: AsyncModel<[Country]> {
    let endpoints = CountryEndpoints()

    override func asyncOperation() async throws -> [Country] {
        return try await endpoints.allCountries()
    }
}

struct CountriesView: View {
    @StateObject var countriesModel = CountriesModel()

    var body: some View {
        AsyncModelView(model: countriesModel) { countries in
            List(countries) { country in
                NavigationLink(
                    destination: {
                        CountryInfoView(country: country)
                    },
                    label: {
                        CountryRowView(country: country)
                    }
                )
            }
        }
        .navigationBarTitle("Countries")
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
