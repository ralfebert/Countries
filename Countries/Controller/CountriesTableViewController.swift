// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var countryImageView: UIImageView!

}

class CountriesTableViewController: UITableViewController {

    let countries = Country.allCountries

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        let country = self.countries[indexPath.row]

        cell.countryNameLabel.text = country.name
        cell.countryImageView.image = UIImage(named: "placeholder")

        return cell
    }

}
