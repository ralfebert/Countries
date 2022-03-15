// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountriesListView: View {
    let countries = countriesExampleData()
    @State var searchText = ""

    var body: some View {
        List(self.filteredCountries) { country in
            NavigationLink(
                destination: {
                    CountryInfoView(country: country)
                },
                label: {
                    CountryRowView(country: country)
                }
            )
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationBarTitle("Countries")
    }

    var filteredCountries: [Country] {
        if self.searchText.isEmpty {
            return self.countries
        } else {
            return self.countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
