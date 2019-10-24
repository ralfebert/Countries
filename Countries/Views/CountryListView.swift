// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountryListView: View {

    let countries = Country.allCountries

    var body: some View {

        NavigationView {
            List(countries) { country in
                NavigationLink(destination: CountryView(country: country)) {
                    CountryRowView(country: country)
                }
            }
            .navigationBarTitle("Länder")
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
