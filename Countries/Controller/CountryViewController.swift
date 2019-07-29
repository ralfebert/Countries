// (C) 2019, Ralf Ebert - iOS Example Project: Countries
// License: https://opensource.org/licenses/0BSD

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageAspectRatioConstraint: NSLayoutConstraint!

    var country: Country? {
        didSet {
            self.view.setNeedsLayout()
            self.navigationItem.title = country?.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        self.imageView.image = self.country?.image

        // Aspect-Ratio Constraint des Image View neu anlegen passierend für das Seitenverhältnis des Bildes
        self.imageAspectRatioConstraint.isActive = false
        if let image = self.country?.image {
            self.imageAspectRatioConstraint = self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor, multiplier: image.size.width / image.size.height)
            self.imageAspectRatioConstraint.isActive = true
        }
    }

}
