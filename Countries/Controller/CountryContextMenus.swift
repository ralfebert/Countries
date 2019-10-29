// © 2019 Ralf Ebert — iOS Example Project: Countries
// License: https://opensource.org/licenses/MIT

import UIKit

@available(iOS 13.0, *)
private func contextMenu(for country: Country, parentViewController: UIViewController) -> UIContextMenuConfiguration {

    let actionProvider: UIContextMenuActionProvider = { _ in

        let openInMaps = UIAction(title: "Auf Karte zeigen", image: UIImage(systemName: "mappin.and.ellipse")) { _ in
            country.openInMaps()
        }
        let share = UIAction(title: "Teilen", image: UIImage(systemName: "square.and.arrow.up")) { [weak parentViewController] _ in
            let shareSheet = UIActivityViewController(activityItems: [country.image], applicationActivities: nil)
            parentViewController?.present(shareSheet, animated: true, completion: nil)
        }

        return UIMenu(title: country.landmark.name, children: [openInMaps, share])
    }

    return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: actionProvider)
}

@available(iOS 13.0, *)
extension CountryViewController {

    func enableContextMenu() {
        imageView.isUserInteractionEnabled = true
        imageView.addInteraction(UIContextMenuInteraction(delegate: self))
    }

}

@available(iOS 13.0, *)
extension CountryViewController: UIContextMenuInteractionDelegate {

    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        guard let country = country else { return nil }
        return contextMenu(for: country, parentViewController: self)
    }

}

@available(iOS 13.0, *)
extension GalleryCollectionViewController {

    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let country = self.countries[indexPath.row]
        return contextMenu(for: country, parentViewController: self)
    }

}
