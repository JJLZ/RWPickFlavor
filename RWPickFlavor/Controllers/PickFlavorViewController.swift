import UIKit
import Alamofire
import MBProgressHUD

public class PickFlavorViewController: UIViewController {
  
  // MARK: Instance Variables
  
  var flavors: [Flavor] = [] {
    didSet {
      pickFlavorDataSource?.flavors = flavors
    }
  }
  
  private var pickFlavorDataSource: PickFlavorDataSource? {
    return collectionView?.dataSource as? PickFlavorDataSource
  }
  
  // MARK: Outlets
  
  @IBOutlet var contentView: UIView!
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var iceCreamView: IceCreamView!
  @IBOutlet var label: UILabel!
  
  // MARK: View Lifecycle
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    loadFlavors()
  }
  
  private func loadFlavors() {
    
    showLoadingHUD()
    
    Alamofire.request("https://www.raywenderlich.com/downloads/Flavors.plist",
                      encoding: PropertyListEncoding.xml)
      .responsePropertyList { [weak self] (response) -> Void in
        
        guard let self = self else {
          return
        }
        
        self.hideLoadingHUD()
        
        let flavorsArray: [[String : String]]
        
        switch response.result {
        case .success(let array):
          flavorsArray = array as? [[String : String]] ?? []
        case .failure(_):
          print("Couldn't download flavors!")
          return
        }
        
        self.flavors = flavorsArray.compactMap(Flavor.init(dictionary:))
        self.collectionView.reloadData()
        self.selectFirstFlavor()
    }
  }
  
  private func showLoadingHUD() {
    let hud = MBProgressHUD.showAdded(to: contentView, animated: true)
    hud.label.text = "Loading..."
  }
  
  private func hideLoadingHUD() {
    MBProgressHUD.hide(for: contentView, animated: true)
  }
  
  private func selectFirstFlavor() {
    if let flavor = flavors.first {
      updateWithFlavor(flavor)
    }
  }
  
  // MARK: Internal
  
  private func updateWithFlavor(_ flavor: Flavor) {
    iceCreamView.updateWithFlavor(flavor)
    label.text = flavor.name
  }
}

// MARK: UICollectionViewDelegate
extension PickFlavorViewController: UICollectionViewDelegate {
  public func collectionView(_ collectionView: UICollectionView,
                             didSelectItemAt indexPath: IndexPath) {
    
    let flavor = flavors[indexPath.row]
    updateWithFlavor(flavor)
  }
}
