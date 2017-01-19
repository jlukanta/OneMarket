import UIKit

class ItemListVC: UITableViewController {
  
  // Item service this screen will use
  public weak var itemService:ItemService!
  
  // Data
  private var items:[DailyItems]!

  // Allows us to organize items by date
  private struct DailyItems {
    var date: Date
    var items: [Item]
  }

  // Register the kind of cell that we are going to use in the list
  override func viewDidLoad () {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellId.Item)
  }
  
  // Load items list from storage
  override func viewWillAppear(_ animated: Bool) {
//    let dates = itemService.getAssignedDates()
//    
//    items = dates.map {
//      (date) -> DailyItems in itemService.getItems(day: date)
//    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // TODO
    return 1;
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    // TODO
    return nil;
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
