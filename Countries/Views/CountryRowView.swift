import SwiftUI
import Kingfisher

struct CountryRowView: View {
    let country: Country

    var body: some View {
        HStack {
            KFImage(country.landmark.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 50)

            Text(self.country.name)
            Spacer()
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryRowView(country: Country.allCountries[1])
                .previewLayout(.fixed(width: 300, height: 44))

            CountryRowView(country: Country.allCountries[2])
                .previewLayout(.fixed(width: 400, height: 80))
        }
    }
}
