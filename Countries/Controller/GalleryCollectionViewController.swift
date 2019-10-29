// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

private let reuseIdentifier = "ImageCell"

class GalleryImageCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
}

class GalleryCollectionViewController: UICollectionViewController {

    var countries = Country.allCountries

    override func viewDidLoad() {
        super.viewDidLoad()

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        self.collectionView.collectionViewLayout = flowLayout
        self.updateLayout(for: self.view.bounds.size)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.updateLayout(for: size)
    }

    private func updateLayout(for size: CGSize) {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = size.width
            let count = Int(width) / 180
            let itemWidth = width / CGFloat(count)
            flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
            flowLayout.invalidateLayout()
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GalleryImageCell

        let country = self.countries[indexPath.row]
        cell.imageView.image = country.image

        return cell
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let controller = segue.destination as? CountryViewController, let cell = sender as? UICollectionViewCell, let indexPath = self.collectionView.indexPath(for: cell) {
            let country = self.countries[indexPath.row]
            controller.country = country
        }

    }
}
