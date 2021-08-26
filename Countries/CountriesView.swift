// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountriesView: View {
    @StateObject var countriesModel = CountriesModel()

    var body: some View {
        List(countriesModel.countries) { country in
            Text(country.name)
        }
        .task {
            await self.countriesModel.reload()
        }
        .refreshable {
            await self.countriesModel.reload()
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
