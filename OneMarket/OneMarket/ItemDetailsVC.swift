import UIKit

class ItemDetailsVC: UIViewController {
  @IBOutlet weak var nameLabel:UILabel!
  @IBOutlet weak var locationLabel:UILabel!
  @IBOutlet weak var dateLabel:UILabel!
  
  // Item service this screen will use
  public var itemService:ItemService!
  
  // The ID of the item we are viewing
  public var itemId:String!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Load item
    guard let item = itemService.getItem(id: itemId) else {
      // TODO: Indicate to the user failure to load item
      print("Failed to load item")
      return;
    }
    
    nameLabel.text = item.name
    locationLabel.text = item.location
    dateLabel.text = String(describing: item.date)
  }
  
  @IBAction func edit (_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: SegueId.ItemEdit, sender: sender)
  }
  
  @IBAction func remove (_ sender: UIBarButtonItem) {
    // Delete item
    itemService.deleteItem(id: itemId)
    
    // Go back to prev page
    navigationController!.popViewController(animated: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    // Prepare transition to edit screen
    if (segue.identifier == SegueId.ItemEdit) {
      let itemEditVC = segue.destination as! ItemEditVC
      itemEditVC.itemId = itemId
    }
  }
}
