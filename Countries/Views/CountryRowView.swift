// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountryRowView: View {

    let country: Country

    var body: some View {

        HStack {
            Image(uiImage: self.country.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50)

            Text(self.country.name)
            Spacer()
        }

    }

}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {

        Group {

            CountryRowView(country: Country.allCountries[1])
                .previewLayout(.fixed(width: 300, height: 44))

            CountryRowView(country: Country.allCountries[2])
                .previewLayout(.fixed(width: 400, height: 80))

        }

    }

}
