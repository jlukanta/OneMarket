import UIKit

class ItemListVC: UITableViewController {
  
  // Item service this screen will use
  public var itemService:ItemService!
  
  // Data
  private var items:[DailyItems]!

  // Allows us to organize items by date
  private struct DailyItems {
    var date: Date
    var items: [Item]
    
    init (date: Date, items: [Item]) {
      self.date = date
      self.items = items
    }
  }
  
  // User has selected a cell -- de-select it and show details page
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: SegueId.ItemDetails, sender: self)
  }

  // Register the kind of cell that we are going to use in the list
  override func viewDidLoad () {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellId.Item)
  }
  
  // Load items list from storage
  override func viewWillAppear(_ animated: Bool) {
    let dates = itemService.getAssignedDates()
    
    items = dates.map {
      (date) -> DailyItems in DailyItems(date: date, items: itemService.getItemsSortedByName(day: date))
    }
    
    tableView.reloadData()
  }
  
  // Number of sections (i.e. the various different days)
  override func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
  }
  
  // Title of sections (i.e. what the day is)
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return String(describing: items[section].date)
  }
  
  override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items[section].items.count
  }
  
  // Display cell (with item name)
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellId.Item)!
    let item = items[indexPath.section].items[indexPath.row]
    
    cell.textLabel!.text = item.name
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    // Prepare transition to details screen
    if (segue.identifier == SegueId.ItemDetails) {
      let vc = segue.destination as! ItemDetailsVC
      let indexPath = tableView.indexPathForSelectedRow!
      let item = items[indexPath.section].items[indexPath.row]
      vc.itemId = item.id
    }
  }
}
