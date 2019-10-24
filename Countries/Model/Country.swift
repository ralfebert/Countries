// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import CoreLocation
import Foundation
import UIKit

struct Landmark: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    var imageUrl: URL
    var metadataUrl: URL
    var copyright: String

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}

struct Country: Codable, Identifiable {

    var id: String { self.iso2 }
    
    var iso2: String
    var name: String
    var landmark: Landmark

    var image: UIImage {
        UIImage(named: self.iso2)!
    }

    static let allCountries: [Country] = {
        let countriesUrl = Bundle.main.url(forResource: "countries", withExtension: "json")!
        let countriesData = try! Data(contentsOf: countriesUrl)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! decoder.decode([Country].self, from: countriesData)
    }()

}
