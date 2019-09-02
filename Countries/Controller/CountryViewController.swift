// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

class CountryViewController: UIViewController {

    var country: Country!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = self.country.name
    }

}
