// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import Foundation

struct CurrencyConverter {
    var amount: Decimal = 1
    var currency: Currency
    var convertedAmount: Decimal {
        get {
            self.amount * self.currency.exchangeRateToEuro
        }
        set {
            self.amount = newValue / self.currency.exchangeRateToEuro
        }
    }
}
