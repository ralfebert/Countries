// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

class CountriesTableViewController: UITableViewController, UISearchResultsUpdating {

    var countries = Country.allCountries

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSearch()
    }

    // MARK: - Search

    private let searchController = UISearchController(searchResultsController: nil)

    func setupSearch() {
        self.navigationItem.searchController = self.searchController
        self.searchController.searchResultsUpdater = self

        // Such-Bar immer sichtbar machen
        self.navigationItem.hidesSearchBarWhenScrolling = false

        // Ausgegraute Darstellung der Suchergebnisse deaktivieren
        self.searchController.obscuresBackgroundDuringPresentation = false
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)

        // Configure the cell...
        let country = self.countries[indexPath.row]
        cell.textLabel?.text = country.name

        return cell
    }

    // MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        // Länderliste filtern, wenn ein Suchtext eingegeben wird
        // Ansonsten alle Länder anzeigen - damit wird auch der Cancel-Fall behandelt
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            self.countries = Country.allCountries.filter { country in
                country.name.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            self.countries = Country.allCountries
        }

        // UITableView aktualisieren
        self.tableView.reloadData()
    }

}
