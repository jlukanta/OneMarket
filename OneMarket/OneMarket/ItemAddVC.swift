import UIKit

class ItemAddVC: UIViewController {
  @IBOutlet weak var nameInput:UITextField!
  @IBOutlet weak var locationInput:UITextField!
  @IBOutlet weak var dateInput:UIDatePicker!
  
  // Item service this screen will use
  public var itemService:ItemService!
  
  // The item we're editing
  var item:Item!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Use a fresh item
    item = itemService.createItem()
    nameInput.text = item.name
    locationInput.text = item.location
    if let date = item.date {
      dateInput.date = date
    }
    

    // Start editing name from the get-go
    nameInput.becomeFirstResponder()
  }
  
  @IBAction func done (_ sender: UIBarButtonItem) {
    
    // Persist item
    item.name = nameInput.text
    item.location = locationInput.text
    item.date = dateInput.date
    itemService.saveItem(item: item)
    
    // Go back to prev page
    navigationController!.popViewController(animated: true)
  }
}
