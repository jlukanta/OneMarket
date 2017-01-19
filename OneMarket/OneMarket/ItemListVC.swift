import UIKit

class ItemListVC: UITableViewController {
  private var dateToItems = Dictionary<Date, Array<Item>>()
  
  // Item service this screen will use
  public weak var itemService:ItemService!
  
  override func viewDidLoad () {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellId.Item)
    
    let item = Item(id : "test_id")
    item.date = Date()
    print(item.dict())
  }
  
  override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellId.Item)!
    cell.textLabel!.text = "Item #" + String(indexPath.row)
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    if (segue.identifier == SegueId.ItemAdd) {
      let itemAddVC = segue.destination as! ItemAddVC
      itemAddVC.itemService = itemService
    } else if (segue.identifier == SegueId.ItemDetails) {
      let itemDetailsVC = segue.destination as! ItemDetailsVC
      itemDetailsVC.itemService = itemService
      // TODO: Set the item's ID  (itemDetailsVc.itemId = ...)
    }
  }
}
