// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CountryInfoView: View {
    let country: Country

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Color.clear
                ProgressView()
                if let imageUrl = country.imageUrl {
                    AsyncImage(
                        url: imageUrl,
                        content: { image in
                            image
                                .resizable()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
            }
            .aspectRatio(4 / 3, contentMode: .fit)
            .frame(maxWidth: .infinity)

            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("**Population** \(Int(country.population / 1_000_000)) Mio.")
                    Text("**Capital** \(country.capital)")
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
                    CurrencyConverterView(currency: currency)
                }
            }

            .padding()
            Spacer()
        }
        .navigationTitle(country.name)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryInfoView(country: Country.exampleData[0])
    }
}
