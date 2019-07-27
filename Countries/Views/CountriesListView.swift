// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/0BSD

import Combine
import SwiftUI

extension Country : Identifiable {

    var id: String {
        return self.iso2
    }
    
}

var countriesPublisher: AnyPublisher<[Country], Never> = {
    let urlSession = URLSession.shared
    let url = URL(string: "https://www.ralfebert.de/examples/countries.json")!

    return urlSession
        .dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: [Country].self, decoder: JSONDecoder())
        .assertNoFailure() // todo: no error handling right now
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()

}()

struct CountriesListView: View {

    @State var countries = [Country]()

    var body: some View {

        List(countries) { country in
            Text(country.name)
        }
        .onReceive(countriesPublisher) { countries in
            self.countries = countries
        }

    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            return CountriesListView(countries: Country.exampleCountries)
        }
    }
#endif
