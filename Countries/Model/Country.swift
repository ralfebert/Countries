// MIT License
//
// Copyright (c) 2019 Ralf Ebert
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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

    var id: String { return self.iso2 }

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
