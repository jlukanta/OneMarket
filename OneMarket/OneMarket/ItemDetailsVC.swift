import UIKit

class ItemDetailsVC: UIViewController {
  @IBOutlet weak var nameLabel:UILabel!
  @IBOutlet weak var locationLabel:UILabel!
  @IBOutlet weak var dateLabel:UILabel!
  
  // Item service this screen will use
  public weak var itemService:ItemService!
  
  // The ID of the item we are viewing
  public var itemId:String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Use a fresh item
    let item = itemService.getItem(id: itemId)
    nameLabel.text = item.name
    locationLabel.text = item.location
    dateLabel.text = String(describing: item.date)
  }
  
  @IBAction func edit (_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: SegueId.ItemEdit, sender: sender)
  }
}
