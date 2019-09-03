// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

class CountryViewController: UIViewController {

    var country: Country!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = self.country.name

        // Appearance kann vom UIViewController per navigationItem-Appearance angepasst werden
        if #available(iOS 13.0, *) {
            if let appearance = self.navigationController?.navigationBar.standardAppearance.copy() {
                appearance.backgroundColor = .magenta
                self.navigationItem.standardAppearance = appearance
            }
        }

    }

}
