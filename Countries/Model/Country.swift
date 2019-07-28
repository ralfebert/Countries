// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/0BSD

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

struct Country: Codable {

    var iso2: String
    var name: String
    var landmark: Landmark

    var image: UIImage {
        return UIImage(named: self.iso2 + ".jpg")!
    }

    static let allCountries: [Country] = {
        let countriesUrl = Bundle.main.url(forResource: "countries", withExtension: "json")!
        let countriesData = try! Data(contentsOf: countriesUrl)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! decoder.decode([Country].self, from: countriesData)
    }()

}
