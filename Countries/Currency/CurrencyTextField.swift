// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct CurrencyTextField: View {
    let currency: Currency
    @Binding var amount: Decimal

    var body: some View {
        TextField(currency.name, value: $amount, format: .number)
            .textFieldStyle(.roundedBorder)
            .frame(maxWidth: .infinity, alignment: .leading)
        Text(currency.name)
            .font(.headline)
    }
}

struct CurrencyTextField_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyTextField(currency: Currency(name: "XY", exchangeRateToEuro: 1.23), amount: .constant(5))
    }
}
