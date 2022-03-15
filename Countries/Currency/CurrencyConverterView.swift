// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CurrencyConverterView: View {
    @State var converter: CurrencyConverter

    var body: some View {
        HStack {
            CurrencyTextField(currency: converter.currency, amount: $converter.amount)
            Text("=")
            CurrencyTextField(currency: Currency(name: "€", exchangeRateToEuro: 1), amount: $converter.convertedAmount)
        }
    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyConverterView(converter: CurrencyConverter(currency: countriesExampleData().compactMap { $0.currency }.first!))
            .previewLayout(.sizeThatFits)
    }
}
