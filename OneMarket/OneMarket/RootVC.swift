import Foundation
import UIKit

// This is the first view controller to be loaded
// Initialize/resolve all dependencies here
class RootVC: UINavigationController {
  private var itemService = DefaultsItemService() as ItemService
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Inject dependencies to root view controller
    let itemList = topViewController as! ItemListVC
    itemList.itemService = itemService
  }
}
