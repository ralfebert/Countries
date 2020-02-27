import UIKit

struct Country {
    var isoCode: String
    var name: String
}

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryTitleLabel: UILabel!
    @IBOutlet weak var countryTextLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
}

class CountriesTableViewController: UITableViewController {

    let countries = [
        Country(isoCode: "at", name: "Austria"),
        Country(isoCode: "be", name: "Belgium"),
        Country(isoCode: "de", name: "Germany"),
        Country(isoCode: "el", name: "Greece"),
        Country(isoCode: "fr", name: "France"),
    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell

        let country = countries[indexPath.row]
        cell.countryTitleLabel?.text = country.name
        cell.countryTextLabel?.text = country.isoCode
        cell.countryImageView?.image = UIImage(named: country.isoCode)

        return cell
    }

}
