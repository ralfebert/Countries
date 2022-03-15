// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import Foundation

struct Country: Identifiable {
    var id: String
    var name: String
    var capital: String
    var population: Int
    var drivingSide: DrivingSide
    var historyFact: String?
    var currency: Currency?
}

enum DrivingSide {
    case right
    case left
}

struct Currency {
    var name: String
    var exchangeRateToEuro: Decimal
}

func countriesExampleData() -> [Country] {
    [
        Country(
            id: "at",
            name: "Austria",
            capital: "Vienna",
            population: 8_935_112,
            drivingSide: .right
        ),
        Country(
            id: "be",
            name: "Belgium",
            capital: "Brussels",
            population: 11_492_641,
            drivingSide: .right,
            historyFact: "In Belgium, there was no elected government for 589 days in 2010."
        ),
        Country(
            id: "de",
            name: "Germany",
            capital: "Berlin",
            population: 83_190_556,
            drivingSide: .right,
            historyFact: "Germany was separated in two separate countries until 1989."
        ),
        Country(
            id: "gr",
            name: "Greece",
            capital: "Athens",
            population: 10_718_565,
            drivingSide: .right
        ),
        Country(
            id: "fr",
            name: "France",
            capital: "Paris",
            population: 67_413_000,
            drivingSide: .right
        ),
        Country(
            id: "gb",
            name: "United Kingdom",
            capital: "London",
            population: 67_081_000,
            drivingSide: .right,
            currency: Currency(name: "£", exchangeRateToEuro: 1.17)
        ),
        Country(
            id: "ch",
            name: "Switzerland",
            capital: "Bern",
            population: 8_570_146,
            drivingSide: .right,
            currency: Currency(name: "CHF", exchangeRateToEuro: 0.94)
        ),
    ]
}
