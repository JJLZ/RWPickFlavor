import UIKit

class ScoopCell: UICollectionViewCell {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 10.0
  }
  
  // MARK: Outlets
  @IBOutlet var textLabel: UILabel!
  @IBOutlet var scoopView: ScoopView!
}

// MARK: Flavor Adapter

extension ScoopCell: FlavorAdapter {
  
  func updateWithFlavor(_ flavor: Flavor) {
    
    scoopView.topColor = flavor.topColor
    scoopView.bottomColor = flavor.bottomColor
    scoopView.setNeedsDisplay()
    
    textLabel.text = flavor.name
  }
}
