// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import MapKit
import SwiftUI

struct CountryInfoView: View {
    let country: Country

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                Image("\(country.id.lowercased())")
                    .resizable()
                    .aspectRatio(4 / 3, contentMode: .fit)

                HStack {
                    Text(country.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    Spacer()
                    Image("\(country.id)-flag")
                }
                .padding()
            }

            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("**Population** \(Int(country.population / 1_000_000)) Mio.")
                    Text("**Capital**: \(country.capital)")
                }

                if let historyFact = country.historyFact {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Did you know?")
                            .bold()
                        Text(historyFact)
                    }
                }

                if let currency = country.currency {
                    Text("**Currency**:")
                    CurrencyConverterView(converter: CurrencyConverter(currency: currency))
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryInfoView(country: countriesExampleData()[1])
    }
}
