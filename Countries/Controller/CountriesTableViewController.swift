import UIKit

struct Country {
    var isoCode: String
    var name: String
}

class CountriesTableViewController: UITableViewController {

    let countries = [
        Country(isoCode: "be", name: "Belgium"),
        Country(isoCode: "bg", name: "Bulgaria"),
        Country(isoCode: "el", name: "Greece"),
        Country(isoCode: "lt", name: "Lithuania"),
        Country(isoCode: "pt", name: "Portugal"),
    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name

        return cell
    }

}
