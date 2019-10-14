// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

class CountriesTableViewController: UITableViewController {

    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.ralfebert.de/examples/countries.json")!

        let urlSession = URLSession.shared

        let task = urlSession.dataTask(with: url) { data, _, error in
            // Fehlerbehandlung für den Fall, das ein Fehler aufgetreten ist und data nicht gesetzt ist
            guard let data = data else {
                debugPrint("Fehler beim Laden", error ?? "Unbekannter Fehler")
                return
            }

            // JSON parsen
            self.countries = try! JSONDecoder().decode([Country].self, from: data)

            // UI-Darstellung aktualisieren
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }

        task.resume()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

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
