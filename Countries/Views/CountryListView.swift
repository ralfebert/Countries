import SwiftUI

struct CountryListView: View {
    let countries = Country.allCountries

    var body: some View {
        NavigationView {
            List(countries) { country in
                CountryRowView(country: country)
            }
            .navigationBarTitle("Countries")
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
