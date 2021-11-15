// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import AsyncView
import SwiftUI

struct CountriesView: View {
    var body: some View {
        AsyncView(
            operation: { try await CountriesEndpoints().countries() },
            content: { countries in
                List(countries) { country in
                    Text(country.name)
                }
            }
        )
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
