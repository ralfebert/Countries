// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CurrencyConverterView: View {
    var currency: Currency

    @State var amount: Decimal = 1
    @State var amountEuro: Decimal = 0

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
                Text(self.amountEuro, format: .number)
                    .padding(6)
                Spacer()
                Text("€")
                    .font(.headline)
            }
        }
        .onChange(of: amount) { newValue in
            self.amountEuro = newValue * currency.exchangeRateToEuro
        }

    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyConverterView(currency: countriesExampleData().compactMap { $0.currency }.first!)
    }
}
