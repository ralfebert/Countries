// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import Foundation

struct CountriesEndpoints {
    let urlSession = URLSession.shared
    let jsonDecoder = JSONDecoder()

    func countries() async throws -> [Country] {
        let url = URL(string: "https://www.ralfebert.de/examples/v3/countries.json")!

        let (data, _) = try await urlSession.data(from: url)
        return try self.jsonDecoder.decode([Country].self, from: data)
    }
}
