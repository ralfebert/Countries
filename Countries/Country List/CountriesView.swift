// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountriesView: View {
    let countries: [Country]

    var body: some View {
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
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(countries: Country.exampleData)
    }
}
