// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountryListView: View {

    let countries = Country.allCountries

    var body: some View {

        Text("\(countries.count) Länder")

    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
