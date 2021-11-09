//
//  CountryEndpoints.swift
//  Countries
//
//  Created by Ralf Ebert on 09.11.21.
//

import Foundation

struct CountryEndpoints {
    
    func allCountries() async throws -> [Country] {
        let url = URL(string: "https://www.ralfebert.de/examples/v3/countries.json")!
        let urlSession = URLSession.shared

        let (data, _) = try await urlSession.data(from: url)
        return try JSONDecoder().decode([Country].self, from: data)
    }
    
}
