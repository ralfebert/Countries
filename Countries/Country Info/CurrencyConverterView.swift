// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CurrencyConverterView: View {
    var currency: Currency

    @State var amount: Decimal = 1

    var body: some View {
        VStack {
            HStack {
                TextField(currency.name, value: $amount, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: .infinity)
                Text(currency.name)
                    .font(.headline)
            }
            HStack {
                Text(self.amount * currency.exchangeRateToEuro, format: .number)
                    .padding(6)
                Spacer()
                Text("€")
                    .font(.headline)
            }
        }
    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyConverterView(currency: Country.exampleData.compactMap(\.currency).first!)
    }
}
