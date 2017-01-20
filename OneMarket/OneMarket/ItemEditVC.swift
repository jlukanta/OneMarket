import UIKit

class ItemEditVC: UIViewController {
  @IBOutlet weak var nameInput:UITextField!
  @IBOutlet weak var locationInput:UITextField!
  @IBOutlet weak var dateInput:UIDatePicker!
  
  // Item service this screen will use
  public var itemService:ItemService!
  
  // The ID of the item we are viewing
  public var itemId:String!
  
  // The item we are editing
  private var item:Item!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Load item
    item = itemService.getItem(id: itemId)
    nameInput.text = item.name
    locationInput.text = item.location
    if let date = item.date {
      dateInput.date = date
    }
    
    // Start editing name from the get-go
    nameInput.becomeFirstResponder()
  }
  
  @IBAction func save (_ sender: UIBarButtonItem) {
    
    // Persist changes
    itemService.saveItem(item: item)
    
    // Go back to previous page
    navigationController!.popViewController(animated: true)
  }
}
