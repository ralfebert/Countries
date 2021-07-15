// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

class CountriesTableViewController: UITableViewController {

    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCountries()
    }

    func loadCountries() {
        let url = URL(string: "https://www.ralfebert.de/examples/countries.json")!

        let urlSession = URLSession.shared

        let task = urlSession.dataTask(with: url) { data, _, error in
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            guard let data = data else {
                debugPrint("Error loading \(url): \(String(describing: error))")
                return
            }

            // Parse JSON with JSONDecoder assuming valid JSON data
            self.countries = try! JSONDecoder().decode([Country].self, from: data)

            // Update UI
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }

        task.resume()
    }

    // MARK: - Table view data source

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

}
