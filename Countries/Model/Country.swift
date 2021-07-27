import CoreLocation
import Foundation

struct Landmark: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    var imageUrl: URL
    var metadataUrl: URL
    var copyright: String

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct Country: Codable, Identifiable {
    var id: String { iso2 }

    var iso2: String
    var name: String
    var landmark: Landmark

    static let allCountries: [Country] = {
        let countriesUrl = Bundle.main.url(forResource: "countries", withExtension: "json")!
        let countriesData = try! Data(contentsOf: countriesUrl)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! decoder.decode([Country].self, from: countriesData)
    }()
}
