// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/0BSD

import Foundation
import MapKit

extension Country {

    func openInMaps() {
        let coordinates = CLLocationCoordinate2D(latitude: self.landmark.latitude, longitude: self.landmark.longitude)
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = self.landmark.name
        mapItem.openInMaps()
    }

}
