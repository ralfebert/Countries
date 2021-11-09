// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import Foundation

struct Country: Identifiable, Codable {
    var id: String
    var name: String
    var capital: String
    var population: Int
    var historyFact: String?
    var currency: Currency?
    var imageUrl: URL?
}

struct Currency: Codable {
    var name: String
    var exchangeRateToEuro: Decimal
}

func countriesExampleData() -> [Country] {
    [
        Country(
            id: "at",
            name: "Austria",
            capital: "Vienna",
            population: 8_935_112
        ),
        Country(
            id: "gb",
            name: "United Kingdom",
            capital: "London",
            population: 67_081_000,
            currency: Currency(name: "£", exchangeRateToEuro: 1.17)
        )
    ]
}
