// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountryRowView: View {
    let country: Country
    var body: some View {
        HStack {
            Image("\(country.id.lowercased())-flag")
            Text(country.name)
        }
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country.exampleData[0])
    }
}
