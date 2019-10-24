// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountryView: View {
    let country: Country

    var body: some View {
        VStack {
            Image(uiImage: country.image)
                .resizable()
                .scaledToFit()
                .navigationBarTitle(country.name)

            Text(country.landmark.name)
        }
    }
}

struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: Country.allCountries[0])
    }
}
