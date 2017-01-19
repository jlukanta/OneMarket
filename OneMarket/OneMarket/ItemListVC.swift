import UIKit

class ItemListVC: UITableViewController {
  var dateToItems = Dictionary<Date, Array<Item>>()
  var itemService:ItemService?
  
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
  
  @IBAction func add (_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: SegueId.ItemAdd, sender: sender)
  }
}
