import Foundation
import UIKit

// This is the first view controller to be loaded
// Initialize/resolve all dependencies here
class RootVC: UINavigationController {
  private var itemService = DefaultsItemService() as ItemService
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    // Inject dependencies to root view controller
    let itemList = segue.destination as! ItemListVC
    itemList.itemService = itemService
  }
}
