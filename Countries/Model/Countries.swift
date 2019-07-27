// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/0BSD

struct Country: Decodable {

    var iso2: String
    var name: String

    #if DEBUG
        static let exampleCountries = [
            Country(iso2: "be", name: "Belgien"),
            Country(iso2: "bg", name: "Bulgarien"),
            Country(iso2: "el", name: "Griechenland"),
            Country(iso2: "lt", name: "Litauen"),
            Country(iso2: "pt", name: "Portugal"),
        ]
    #endif

}
