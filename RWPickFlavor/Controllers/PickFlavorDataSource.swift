import UIKit

class PickFlavorDataSource: NSObject {
  
  // MARK: Identifiers
  
  private enum Identifiers {
    static let ScoopCell = "ScoopCell"
  }
  
  // MARK: Instance Variables
  
  var flavors: [Flavor] = []
  
  // MARK: Outlets
  
  @IBOutlet var collectionView: UICollectionView!
  
  // MARK: -
  
  private func scoopCellAtIndexPath(indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: Identifiers.ScoopCell, for: indexPath) as? ScoopCell else {
        return UICollectionViewCell()
    }
    
    configureScoopCell(cell: cell, atIndexPath: indexPath)
    return cell
  }
  
  private func configureScoopCell(cell: ScoopCell, atIndexPath indexPath: IndexPath) {
    let flavor = flavors[indexPath.row]
    cell.updateWithFlavor(flavor)
  }
  
}

// MARK: - UICollectionViewDataSource
extension PickFlavorDataSource: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return flavors.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    return scoopCellAtIndexPath(indexPath: indexPath)
  }
}
