// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import SwiftUI

struct LoadCountriesView: View {
    let endpoints = CountriesEndpoints()

    enum LoadingState {
        case empty
        case loading
        case success([Country])
        case error(Error)
    }

    @State var state: LoadingState = .empty

    var body: some View {
        VStack {
            switch state {
                case .empty:
                    EmptyView()
                case .loading:
                    ProgressView()
                case let .success(countries):
                    CountriesView(countries: countries)
                case let .error(error):
                    Text(error.localizedDescription)
            }
        }
        .task {
            do {
                self.state = .success(try await self.endpoints.countries())
            } catch {
                self.state = .error(error)
            }
        }
        .navigationBarTitle("Countries")
    }
}

struct LoadCountriesView_Previews: PreviewProvider {
    static var previews: some View {
        LoadCountriesView()
    }
}
